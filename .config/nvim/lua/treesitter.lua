require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {"R", "r", "Rmd", "rmd"}
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "m",
            node_incremental = "m",
            -- scope_incremental = "<c-m>",
            node_decremental = "M",
        },
    },
    -- indent = {
    --     enable = true,
    -- },
    -- autopairs = {
    --     enable = true,
    -- },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim.
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm.
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aC"] = "@call.outer",
                ["iC"] = "@call.inner",
                ["aB"] = "@block.outer",
                ["iB"] = "@block.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["a#"] = "@comment.outer",
                ["ii"] = "@conditional.inner",
                ["ai"] = "@conditional.inner",
                ["iL"] = "@loop.inner",
                ["aL"] = "@loop.outer",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]]"] = "@class.outer",
                ["]i"] = "@conditional.inner",
                ["]l"] = "@loop.inner",
                ["s"] = "@parameter.inner",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]["] = "@class.outer",
                ["]I"] = "@conditional.inner",
                ["]L"] = "@loop.inner",
                ["gs"] = "@parameter.inner",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[["] = "@class.outer",
                ["[i"] = "@conditional.inner",
                ["[l"] = "@loop.inner",
                ["S"] = "@parameter.inner",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[]"] = "@class.outer",
                ["[I"] = "@conditional.inner",
                ["[L"] = "@loop.inner",
                ["gS"] = "@parameter.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
                ["<M-d>"] = "@function.outer",
                ["<M-d>"] = "@class.outer",
            },
        },
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
        },
    },
}
