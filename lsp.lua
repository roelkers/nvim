-- local lsp_zero = require('lsp-zero')

-- lsp_zero.on_attach(function(client, bufnr)
--   -- see :help lsp-zero-keybindings
--   -- to learn the available actions
--   lsp_zero.default_keymaps({buffer = bufnr})
-- end)

-- local eslint = require('efmls-configs.linters.eslint')
-- local prettier = require('efmls-configs.formatters.prettier')
-- local stylua = require('efmls-configs.formatters.stylua')
-- local languages = {
--   -- typescript = { typescript },
--   lua = { stylua },
-- }

-- local languages = require('efmls-configs.defaults').languages()

-- local efmls_config = {
--   filetypes = vim.tbl_keys(languages),
--   settings = {
--     rootMarkers = { '.git/' },
--     languages = languages,
--   },
--   init_options = {
--     documentFormatting = true,
--     documentRangeFormatting = true,
--   },
-- }

--require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
--  -- Pass your custom lsp config below like on_attach and capabilities
--  --
--  -- on_attach = on_attach,
--  -- capabilities = capabilities,
--}))
