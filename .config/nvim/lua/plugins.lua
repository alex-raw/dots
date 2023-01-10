local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nathom/filetype.nvim'

    -- Looky
    use 'romainl/vim-cool'
    use 'rmehri01/onenord.nvim'

    -- use 'navarasu/onedark.nvim'
    -- use 'folke/tokyonight.nvim'
    -- use 'catppuccin/vim'
    -- use 'EdenEast/nightfox.nvim'

    use 'baskerville/vim-sxhkdrc'
    -- use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- Editing
    use 'vim-scripts/ReplaceWithRegister'
    use 'FooSoft/vim-argwrap'
    use 'machakann/vim-sandwich'
    use 'sbdchd/neoformat'
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs'
    use 'junegunn/vim-easy-align'

    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-line'
    use 'julian/vim-textobj-variable-segment'

    -- Navigation
    use 'justinmk/vim-sneak'
    use 'ThePrimeagen/harpoon'
    use { 'nvim-telescope/telescope.nvim',
        requires = {
            { 'kyazdani42/nvim-web-devicons' },
            { 'nvim-lua/popup.nvim' }
        }
    }
    use "pschmitt/telescope-yadm.nvim"

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}}
    use 'nvim-treesitter/nvim-treesitter-refactor' -- for highlighting under cursor

    -- -- Snippets
    use 'L3MON4D3/LuaSnip'
    -- use 'rafamadriz/friendly-snippets'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'f3fora/cmp-spell'
    use 'aspeddro/cmp-pandoc.nvim'
    use 'saadparwaiz1/cmp_luasnip'

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'TimUntersberger/neogit'

    -- Language-specific
    use 'sheerun/vim-polyglot'
    use 'JuliaEditorSupport/julia-vim'
    use 'kdheepak/JuliaFormatter.vim'
    use 'alex-raw/cqp.vim'
    use 'jalvesaq/Nvim-R'

    -- -- Writing
    -- use { 'vim-pandoc/vim-rmarkdown', requires = {
    --     'vim-pandoc/vim-pandoc',
    --     'vim-pandoc/vim-pandoc-syntax'
    -- },
    -- }

    use 'vim-scripts/abolish.vim'
    use 'jdelkins/vim-correction'
    use 'vim-scripts/ingo-library'
    use 'vim-scripts/SpellCheck'

    -- Apps
    use 'https://git.sr.ht/~soywod/himalaya-vim'
    use "nvim-neorg/neorg"
    -- use 'soywod/phonetics.vim'
    -- use 'alex-raw/vimling'

    use "williamboman/mason.nvim"
    use 'williamboman/mason-lspconfig.nvim'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('Comment').setup()

require('lualine').setup {
    sections = {
        lualine_a = {'filetype'},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {'diagnostics'},
        lualine_y = {'diff'},
        lualine_z = {'branch'}
    },
}

require("cmp_pandoc").setup({
    filetypes = { "markdown", "markdown.pandoc", "rmd", "rmarkdown", },
    bibliography = {
        documentation = true,
        fields = { "type", "title", "author", "year" },
    },
    crossref = {
        documentation = true,
    }
})

-- TODO: this doesn't seem to do anything
require('onenord').setup({
    styles = {
        comments = "italic",
    },
})

require("mason").setup()
require("mason-lspconfig").setup()

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {"undodir", "_book"},
    }
})

require("telescope").load_extension("yadm_files")
require("telescope").load_extension("git_or_yadm_files")
