local iron = require('iron.core')

iron.setup {
  config = {
    repl_definition = {
      r = {
        -- radian = {
        --   command = {"R", "--quiet", "--no-save"}
        -- }
        radian = {
          command = {"radian", "--quiet", "--no-history"}
        }
      },
      rmarkdown = {
        radian = {
          command = {"radian", "--quiet", "--no-history"}
        }
      },
      julia = {
        multi = {
          command = {"julia", "--threads=auto", "--quiet"}
        }
      },
    }
  }
}

vim.api.nvim_exec([[
    let g:iron_map_defaults = 0
    let g:iron_map_extended = 0
    map  <F11> :IronRepl<CR>
    nmap -    <Plug>(iron-send-motion)
    vmap -    <Plug>(iron-visual-send)
    nmap -    <Plug>(iron-send-line)
    nmap <localleader><CR> <Plug>(iron-cr)
    nmap <c-C>    <plug>(iron-interrupt)
    nmap <c-L>    <Plug>(iron-clear)
]],
  true
)
