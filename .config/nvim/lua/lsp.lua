local configs = require'lspconfig'
local tele = require('telescope.builtin')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local nn = function(key, action)
    vim.keymap.set('n', key, action, {buffer = 0})
end

local on_attach = function()
    nn('K',          vim.lsp.buf.hover)
    nn('<leader>k',  vim.lsp.buf.signature_help)
    nn('gd',         vim.lsp.buf.definition)
    nn('gD',         vim.lsp.buf.declaration)
    nn('gT',         vim.lsp.buf.type_definition)
    nn('<leader>rr', vim.lsp.buf.references)
    nn('<leader>rn', vim.lsp.buf.rename)
    nn('gi',         vim.lsp.buf.implementation)
    nn('<leader>wa', vim.lsp.buf.add_workspace_folder)
    nn('<leader>wr', vim.lsp.buf.remove_workspace_folder)
    nn('<leader>ca', vim.lsp.buf.code_action)
    nn('[d',         vim.diagnostic.goto_prev)
    nn(']d',         vim.diagnostic.goto_next)
    nn('<leader>e',  vim.diagnostic.open_float)
    nn('<leader>ll', vim.diagnostic.setqflist)
    nn('<leader>ds', tele.lsp_document_symbols)
    nn('<leader>ws', tele.lsp_workspace_symbols)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.diagnostic.config({virtual_text = false, underline = false})
end

configs.r_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "r" },
    settings = {
        rich_documentation = false
    }
}

-- configs.sumneko_lua.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { "lua" },
--     settings = {
--         rich_documentation = false
--     }
-- }

-- Enable the following language servers. If you ever find yourself needing another programming language support, you'll have to find its LSP, add it to this list and make sure it is installed in your system! We'll go through installing tsserver together for TypeScript support.
local servers = {
    'pylsp',
    'bashls',
    'awk_ls',
    "luau_lsp",
    "prosemd_lsp",
    "zk",
    "remark_ls",
    "marksman",
    "texlab",
    -- "ltex"
}
for _, lsp in ipairs(servers) do
    configs[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

local util = require'lspconfig/util'
local environment_directory = util.path.join(util.base_install_dir, "julials")

local function create_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.preselectSupport = true
    capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
    capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
    }
    capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
    capabilities.textDocument.codeAction = {
        dynamicRegistration = true,
        codeActionLiteralSupport = {
            codeActionKind = {
                valueSet = (function()
                    local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                    table.sort(res)
                    return res
                end)(),
            },
        },
    }
    return capabilities
end

-- disable virtual text (recommended for julia)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false,
    signs = true,
    update_in_insert = false,
})

configs.julials.setup{
    on_attach = on_attach,
    capabilities = create_capabilities(),
    -- on_new_config = function(new_config, _)
    --     local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
    --     if require'lspconfig'.util.path.is_file(julia) then
    --         new_config.cmd[1] = julia
    --     end
    -- end
}


configs.ltex.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- use_spellfile = false,
  filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
  settings = {
    ltex = {
      enabled = { "latex", "tex", "bib", "markdown", },
      language = "auto",
      -- diagnosticSeverity = "information",
      -- sentenceCacheSize = 2000,
      -- additionalRules = {
      --   motherTongue = "de",
      -- },
      dictionary = (function()
        -- For dictionary, search for files in the runtime to have
        -- and include them as externals the format for them is
        -- dict/{LANG}.txt
        --
        -- Also add dict/default.txt to all of them
        local files = {}
        for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
          local lang = vim.fn.fnamemodify(file, ":t:r")
          local fullpath = vim.fs.normalize(file, ":p")
          files[lang] = { ":" .. fullpath }
        end

        if files.default then
          for lang, _ in pairs(files) do
            if lang ~= "default" then
              vim.list_extend(files[lang], files.default)
            end
          end
          files.default = nil
        end
        return files
      end)(),
    },
  },
}
