let mapleader =" "
let maplocalleader = "'"

" German layout problem
im ´ `

" experiments
nor " ^
nor ^ "

" weird ergodox ez bug with quick key presses
im ~⅞ ~/

let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "rawpower"
    no j r| no r gk
    no k n| no n gj
endif

no L $
no H ^

nn <Backspace><Backspace> :q<cr>
nn Q :q!

nn <F5>  :w<cr>

nn ciq ci"

map <c-n> :cnext<cr>

" " Pairs
" ino () ()<left>
" ino {} {}<left>
" ino [] []<left>
" ino <> <><left>
" ino "" ""<left>
" ino '' ''<left>
"
" enclose
" ino (( (<End>)<Esc>i
" ino [[ [<End>]<Esc>i
" ino {{ {<Esc>}<Esc>i

" string lists
ino ,, ",<space>"

" Terminals and Splits
tno <Esc><left> <C-\><C-N><C-w>h
tno <Esc><down> <C-\><C-N><C-w>j
tno <Esc><up> <C-\><C-N><C-w>k
tno <Esc><right> <C-\><C-N><C-w>l
tno <Esc><BackSpace><BackSpace> <C-\><C-N>:q<cr>

nn <Esc><left> <C-\><C-N><C-w>h
nn <Esc><down> <C-\><C-N><C-w>j
nn <Esc><up> <C-\><C-N><C-w>k
nn <Esc><right> <C-\><C-N><C-w>l

" Undo break points
ino , ,<c-g>u
ino . .<c-g>u
ino ! !<c-g>u
ino ? ?<c-g>u

nn <M-s> :%s///g<left><left><left>
vn <M-s> :s///g<left><left><left>

map <leader>Q :copen<cr>
map <leader>q :cclose<cr>

" External scripts
map <leader>c :w! \| !compiler <c-r>%<cr>
map <leader>p :!opout <c-r>%<cr><cr>
map <leader>B :40vsp<space>$BIB<cr>

" Plugin mappings
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
map ; <Plug>Sneak_,
map , <Plug>Sneak_;

nn <leader>ha <cmd>lua require'harpoon.mark'.add_file()<cr>
nn <leader>hl <cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>
nn <leader>! <cmd>lua require'harpoon.ui'.nav_file(1)<cr>
nn <leader>[ <cmd>lua require'harpoon.ui'.nav_file(2)<cr>
nn <leader>{ <cmd>lua require'harpoon.ui'.nav_file(3)<cr>
nn <leader>( <cmd>lua require'harpoon.ui'.nav_file(4)<cr>
nn <leader>= <cmd>lua require'harpoon.ui'.nav_file(5)<cr>
nn <leader>1 <cmd>lua require'harpoon.ui'.nav_file(1)<cr>
nn <leader>2 <cmd>lua require'harpoon.ui'.nav_file(2)<cr>
nn <leader>3 <cmd>lua require'harpoon.ui'.nav_file(3)<cr>
nn <leader>4 <cmd>lua require'harpoon.ui'.nav_file(4)<cr>
nn <leader>5 <cmd>lua require'harpoon.ui'.nav_file(5)<cr>

nn <leader>f <cmd>Telescope find_files<cr>
nn <leader>g <cmd>Telescope live_grep<cr>
nn <leader>b <cmd>Telescope buffers<cr>
nn <leader>? <cmd>Telescope oldfiles<cr>
" nn <leader>df <cmd>lua require'telescope.builtin'.find_files({cwd = "~/.config"})<cr>
nn <leader>s <cmd>Telescope spell_suggest<cr>

nn <M-w> :ArgWrap<cr>
nn <M-f> :Neoformat<cr>
vn <M-f> :Neoformat<cr>
nn <M-g> :Neogit<cr>
nn <leader>F :NeoTreeFloatToggle<cr>

xm ga <Plug>(EasyAlign)
nm ga <Plug>(EasyAlign)
nn <leader>sc :SpellCheck<cr>:copen<cr><cr>

let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
" sil! nm <unique><silent> <localleader>d <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
" sil! nm <unique><silent> <localleader>r <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

silent! nmap <unique><silent> <localleader>d <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> <localleader>r <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> <localleader>db <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> <localleader>rb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! map <unique> <localleader> <Plug>(operator-sandwich-add)
silent! xmap <unique> <localleader>d <Plug>(operator-sandwich-delete)
silent! xmap <unique> <localleader>r <Plug>(operator-sandwich-replace)

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
im <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-jump-next' : '<Tab>'
snor <silent> <Tab> <cmd>lua require'luasnip'.jump(1)<cr>
ino <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<cr>
snor <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
im <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" R
au BufRead,BufNewFile *R,*r,*Rmd,*rmd call RBindings()
function RBindings()
    ino -- <space><-<space>

    nn <F11> <Plug>RStart
    nn <M-l> :RSend devtools::load_all()<cr>
    nn ð :RSend devtools::document()<cr>
    nn ŧ :RSend test()<cr>
    nn K <Plug>RHelp


    nn <localleader>m <Plug>RSendMotion
    nn <Return> <Plug>RDSendLine
    vn <Return> <Plug>RSendSelection

    nn - :call RAction("print")<CR>
    nn <c-l> :call RClearConsole()<CR>
    nn ħ :call RAction("help")<CR>
    nn ø :call RObjBrowser()<CR>
    nn æ :call RAction("args")<CR>
    nn ð :RSend document()<CR>
    nn ł :RSend load_all()<CR>

    nn <M-r> :call RAction("head")<CR>
    nn <M-n> :call RAction("tail")<CR>
    nn ¢ :call RAction("class")<CR>
    nn <M-s> :call RAction("str")<CR>
    nn ſ :call RAction("summary")<CR>

endfunction
