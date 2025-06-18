-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local ranger = require("ranger-nvim")
-- Function to toggle a vertical terminal
local function toggle_vertical_terminal()
  local term_buf = nil
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      term_buf = buf
      break
    end
  end

  if term_buf then
    -- Close the terminal if it exists
    vim.cmd("bd! " .. term_buf)
  else
    -- Otherwise, open a new terminal in a vertical split
    vim.cmd("vsplit | terminal")
  end
end

-- vim.keymap.del("n", "<C-i>", { silent = true }) -- Ensure default is removed
vim.keymap.set("n", "<C-i>", toggle_vertical_terminal, { desc = "Toggle vertical terminal" })

vim.keymap.set("n", "r", ranger.open)

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gw", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "T", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
-- vim.keymap.set("n", "<leader>i", vim.lsp.buf.formatting_sync)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "s", "<Plug>(leap)")

vim.keymap.set("", "<C-p>", require("fzf-lua").files)
--vim.keymap.set("", "<C-f>", require("fzf-lua").grep_project)
vim.keymap.set("", "<C-f>", require("fzf-lua").grep_last)
vim.keymap.set("", "<C-F>", require("fzf-lua").grep_cword)
vim.keymap.set("", "<C-c>", require("fzf-lua").buffers)
vim.keymap.set("", "<C-g>", require("fzf-lua").grep)

vim.keymap.set("", "<C-x>", require("fzf-lua").git_status)
vim.keymap.set("", "<C-o>", require("fzf-lua").oldfiles)
vim.keymap.set("", "<leader>r", require("fzf-lua").resume)
vim.keymap.set("", "<leader>h", require("fzf-lua").search_history)

-- Navigation
vim.keymap.set("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
vim.keymap.set("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- Actions
vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
vim.keymap.set("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
vim.keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
vim.keymap.set("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>")
vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>")
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>")

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
-- Text object
vim.keymap.set("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
vim.keymap.set("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
