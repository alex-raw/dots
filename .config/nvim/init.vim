lua << EOF
require("plugins")
require("lsp")
require("plugs.gitsigns")
require("plugs.cmp")
require("plugs.autopairs")
require("treesitter")
-- require("plugs.iron")
-- require("plugs.snippets")
EOF

set updatetime=50
set wildmode=longest,list,full
set hidden
set splitbelow splitright
set ignorecase
set smartcase
set nospell
set spelloptions=camel,noplainbuffer

" editing
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set clipboard+=unnamedplus
au FileType * set formatoptions-=cro

" looky
" set number relativenumber numberwidth=1
set nonumber norelativenumber
set nowrap
set linebreak " if wrap, break at whitespace
set breakindent " if wrap indent breaks
set cursorline
set signcolumn=yes
set noequalalways
set foldlevel=99
set termguicolors
set textwidth=80
set colorcolumn=+1
set fillchars+=vert:┃

colorscheme onenord

" terminal
au TermOpen * setlocal nonumber norelativenumber signcolumn=no
au BufWinEnter,WinEnter term://* startinsert

" Keep undo history across sessions by storing it in a file
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif

augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

" Execute on write or exit
au VimLeave *.tex !texclear %
au BufWritePre * %s/\s\+$//e
au BufWritePost *sxhkdrc !pkill -USR1 sxhkd

au BufRead,BufNewFile *vifmrc* set ft=vim
au BufRead,BufNewFile neomutt* set ft=mail
au BufRead,BufNewFile *.mail set ft=mail
au BufRead,BufNewFile *.ron set ft=rust
" au BufRead,BufNewFile *Rmd set ft=rmd
au BufRead,BufNewFile *Rmd,rmd set ft=markdown

au BufRead,BufNewFile *Rmd,rmd call RmdHighlighting()
function RmdHighlighting()
  syn match LatexOperator /[{}\\]/
  syn match LatexFun /\\\w\+/

  syn region crossref matchgroup=crossref start=+\\ref{+ end=+}+ contains=crossrefkey
  syn match crossrefkey /\w\+/ contained
  syn match crossrefkey /@\w\+/

  syn region LatexLabel matchgroup=LatexLabel start=+\\label{+ end=+}+ contains=LatexLabelKey
  syn match LatexLabelKey /\w\+/ contained

  syn region LatexItalics matchgroup=LatexItalics start=+\\textit{+ end=+}+ contains=LatexItalicsText
  syn match LatexItalicsText /\w\+/ contained

  hi def link LatexOperator Delimiter
  hi def link LatexFun Function
  hi def link crossrefkey Operator
  hi def link crossref Function
  hi def link LatexLabelKey Operator
  hi def link LatexLabel Function
  hi def link LatexItalics Function
  hi def link LatexItalicsText TSEmphasis
endfunction

au BufRead,BufNewFile * set laststatus=3

set spelllang=en_us
" au Filetype vimwiki setlocal nospell
au FileType mail set spell
au FileType mail set wrap
au FileType julia set shiftwidth=4 tabstop=4 softtabstop=4
au FileType julia set textwidth=92 " according to Julia's CONTRIBUTING guidelines
let g:latex_to_unicode_auto = 1

set mousemodel=extend
" Include mouse clicks in jump list
nnoremap <LeftMouse> m'<LeftMouse>

let g:correction_filetypes = [
      \ 'text', 'rmd', 'Rmd', 'rmarkdown', 'markdown', 'gitcommit', 'plaintex',
      \ 'tex', 'latex', 'rst', 'asciidoc', 'textile', 'pandoc' ]


au FileType r,rmarkdown set shiftwidth=2 tabstop=2 softtabstop=2
au FileType r hi link @parameter Special
au FileType r hi link @namespace TSNamespace
au FileType r hi clear Error

let g:copilot_filetypes = {'markdown': v:true, 'rmarkdown': v:true}

" nvimR
let R_args = ["--quiet", "--no-save"]
let R_auto_start = 0
let R_objbr_auto_start = 0
" |R-built-in-terminal|   Options to control Vim/Neovim's built-in terminal
let R_assign = 0
let R_clear_console = 1
let R_clear_line = 1
let R_user_maps_only = 1
let R_rconsole_width = 57
let R_min_editor_width = 18
let R_hi_fun_globenv = 2
let Rout_more_colors = 0

let g:himalaya_folder_picker = 'telescope'

runtime bindings.vim
