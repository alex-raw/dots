local npairs = require'nvim-autopairs'

npairs.setup {
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
    },
    disable_filetype = { "TelescopePrompt" },
    fast_wrap = {
        map = '<right>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = -1, -- Offset from pattern match
        end_key = '$',
        keys = 'eaiuoxvlcwkhgfqsnrtdbmj',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
}

local cond = require('nvim-autopairs.conds')

npairs.get_rule("'")[1]
:with_pair(cond.not_before_regex("^#$"))

-- prevent clash with snippets
npairs.get_rule('`')
 :with_pair(cond.not_filetypes({"rmd"}))

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
