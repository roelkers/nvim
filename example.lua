-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
local actions = require("fzf-lua").actions

if true then
  return {
    {
      "zbirenbaum/copilot.lua",
      opts = function(_, opts)
        opts.suggestion = opts.suggestion or {}
        opts.suggestion.debounce = 200
        return opts
      end,
    },
    {
      "olimorris/codecompanion.nvim",
      opts = {},
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
    },
    {
      "kelly-lin/ranger.nvim",
      opts = {
        replace_netrw = true,
        ui = {
          height = 0.75,
          width = 0.75,
          border = "rounded",
        },
      },
    },
    {
      "Pocco81/auto-save.nvim",
      opts = {
        enabled = true,
        debounce_delay = 135,
      },
    },
    {
      "ggandor/leap.nvim",
    },
    {
      "lewis6991/gitsigns.nvim",
      opts = {
        numhl = false,
        linehl = false,
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
        },
        word_diff = false,
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- Actions
          map("n", "<leader>hs", gitsigns.stage_hunk)
          map("n", "<leader>hr", gitsigns.reset_hunk)
          map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          map("n", "<leader>hS", gitsigns.stage_buffer)
          map("n", "<leader>hu", gitsigns.undo_stage_hunk)
          map("n", "<leader>hR", gitsigns.reset_buffer)
          map("n", "<leader>hp", gitsigns.preview_hunk)
          map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
          end)
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
          map("n", "<leader>hd", gitsigns.diffthis)
          map("n", "<leader>hD", function()
            gitsigns.diffthis("~")
          end)
          map("n", "<leader>td", gitsigns.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      },
    },
    {
      "ibhagwan/fzf-lua",
      -- change some options
      opts = {
        fullscreen = true,
        actions = {
          files = { true, ["ctrl-l"] = actions.file_edit_or_qf },
          oldfiles = { true, ["ctrl-l"] = actions.file_edit_or_qf },
          grep = { true, ["ctrl-l"] = actions.file_edit_or_qf },
          git_status = { true, ["ctrl-l"] = actions.file_edit_or_qf },
          grep_project = { true, ["ctrl-l"] = actions.file_edit_or_qf },
        },
        winopts = {
          preview = {
            horizontal = "right:40%",
          },
        },
      },
    },
    {
      "saghen/blink.cmp",
      -- change some options
      --
      opts = {
        keymap = {},
      },
    },
  }
end
