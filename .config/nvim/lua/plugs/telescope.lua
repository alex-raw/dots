require('telescope').setup({
    defaults = {
        file_ignore_patterns = {"undodir", "_book"},
    }
})

local M = {}

function M.edit_dots()
    require('telescope.builtin').git_files {
        cwd = "~/.config"
    }
end

require("telescope").load_extension("yadm_files")
require("telescope").load_extension("git_or_yadm_files")
