  use 'mfussenegger/nvim-dap'
  use {'nvim-telescope/telescope-dap.nvim'}
  use {'theHamsta/nvim-dap-virtual-text'}

vim.g.dap_virtual_text = true

key_mapper('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>')
key_mapper('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
key_mapper('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
key_mapper('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
key_mapper('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')

key_mapper('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
key_mapper('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
key_mapper('v', '<leader>dhv',
          '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

key_mapper('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
key_mapper('n', '<leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

key_mapper('n', '<leader>dsbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
key_mapper('n', '<leader>dsbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
key_mapper('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
key_mapper('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')

local dap = require('dap')
