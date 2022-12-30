--
--LSP colors
--
-- vim.cmd([[
--   augroup lspxcolors
--    autocmd ColorScheme * call v:lua.vim.lsp.diagnostic._define_default_signs_and_highlights()
--   augroup END
-- ]])
-- Highlight current window
-- vim.cmd([[
--   augroup statuslineBG 
--     autocmd ColorScheme * highlight StatusLine ctermfg=#ffffff ctermbg=#232731
--     autocmd ColorScheme * highlight StatusLineNC ctermfg=#ffffff  ctermbg=#444444
--   augroup END
-- ]])
-- vim.cmd([[
--   augroup highlightLspError 
--    autocmd ColorScheme * highlight LspDiagnosticsUnderlineError ctermfg=#ff0000 ctermbg=#232731
--    autocmd ColorScheme * highlight LspDiagnosticsUnderlineHint ctermfg=#ffffff ctermbg=#232731
--    autocmd ColorScheme * highlight LspDiagnosticsUnderlineInfo ctermfg=#ffffff ctermbg=#232731
--    autocmd ColorScheme * highlight LspDiagnosticsUnderlineWarning ctermfg=#ffffff ctermbg=#232731
--   augroup END
-- ]])


--
--Options
--
vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.bo.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.hidden = true
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.wo.number = true
--vim.wo.relativenumber = true
vim.wo.wrap = false
vim.g.mapleader = " "
vim.o.completeopt = 'menuone,noselect'
vim.g.rnvimr_ex_enable = 1
vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_pick_enable = 1
vim.g.rnvimr_bw_enable = 1
vim.g.noswapfile = true
vim.g.mouse = n
vim.g.encoding = "UTF-8"
vim.g.dashboard_default_executive = 'telescope'
vim.o.clipboard = "unnamedplus"

local home = os.getenv('HOME')

--
--Mappings
--
local key_mapper = function(mode, key, result)	
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

key_mapper('n', 'r', ':RnvimrToggle<CR>')
key_mapper('n', '<ESC>', ':noh<CR><ESC>')
key_mapper('', '<C-l>', '<C-w>l')
key_mapper('', '<C-h>', '<C-w>h') 
key_mapper('', '<C-k>', '<C-w>k') 
key_mapper('', '<C-j>', '<C-w>j') 
key_mapper('t', '<A-k>', '<C-\\><C-N><C-w>k')
key_mapper('t', '<A-h>', '<C-\\><C-N><C-w>h')
key_mapper('t', '<A-j>', '<C-\\><C-N><C-w>j')
key_mapper('t', '<A-l>', '<C-\\><C-N><C-w>l')
key_mapper('t', '<A-n>', '<C-\\><C-N>')
key_mapper('i', '<A-k>', '<C-\\><C-N><C-w>k')
key_mapper('i', '<A-h>', '<C-\\><C-N><C-w>h')
key_mapper('i', '<A-j>', '<C-\\><C-N><C-w>j')
key_mapper('i', '<A-l>', '<C-\\><C-N><C-w>l')
key_mapper('n', '<A-k>', '<C-w>k')
key_mapper('n', '<A-h>', '<C-w>h')
key_mapper('n', '<A-j>', '<C-w>j')
key_mapper('n', '<A-l>', '<C-w>l')
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
key_mapper('n', '<leader>i', ':lua vim.lsp.buf.formatting_sync()<CR>')
key_mapper('n', '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>')
key_mapper('n', '<leader>dp', ':lua vim.diagnostic.goto_prev()<CR>')
key_mapper('', '<C-p>', ':lua require"telescope.builtin".find_files({ search_dirs = { "/home/rufus/Dev", "/Users/oelkersr/Dev" } })<CR>')
key_mapper('', '<C-f>', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')
key_mapper('', '<C-c>', ':lua require("telescope.builtin").buffers()<CR>')
key_mapper('', '<C-g>', ':lua require"telescope.builtin".grep_string({ search=vim.fn.input("Grep for >") })<CR>')
key_mapper('', '<C-y>', ':lua require"telescope.builtin".grep_string()<CR>')
key_mapper('', '<C-e>', ':lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>')
key_mapper('', '<leader>gc', ':lua require("telescope.builtin").git_commits()<CR>')
key_mapper('', '<leader>gb', ':lua require("telescope.builtin").git_branches()<CR>')
key_mapper('', '<C-x>', ':lua require("telescope.builtin").git_status()<CR>')
key_mapper('', '<C-o>', ':lua require("telescope.builtin").oldfiles()<CR>')
key_mapper('', '<leader>r', ':lua require("telescope.builtin").pickers()<CR>')
key_mapper('', '<leader>h', ':lua require("telescope.builtin").search_history()<CR>')
key_mapper('', '<C-i>', ':lua require("telescope.builtin").resume()<CR>')
key_mapper('', '<C-a>', ':lua require("telescope").extensions.frecency.frecency()<CR>')
key_mapper('', '<leader>c', ':cclose<CR>')
key_mapper('n', 's', ':HopWord<CR>')
key_mapper('n', '<leader>dt', ':Gitsigns diffthis<CR>')
key_mapper('n', '<leader>gg', ':LazyGit<CR>')
key_mapper('i', '<C-BS>', '<C-w>')
key_mapper('i', '<C-h>', '<C-w>')
key_mapper('n', '<leader>dh', ':DashboardFindHistory')
key_mapper('n', '<leader>ds', ':SessionSave<CR>')
key_mapper('n', '<leader>dl', ':SessionLoad<CR>')
key_mapper('n', '<leader>b', ':Neotree buffers toggle<CR>')
key_mapper('n', '<leader>f', ':Neotree filesystem toggle<CR>')

--
--Plugins
--
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

local packer = require'packer'
local util = require'packer.util'

packer.startup(function()
  local use = use
  
  use 'wbthomason/packer.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'

  --theme
 --use 'tjdevries/colorbuddy.nvim'

  use 'christianchiarulli/nvcode-color-schemes.vim' 
  
  use 'kyazdani42/nvim-web-devicons'
  
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'

  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use "hrsh7th/nvim-cmp"
  use 'rafamadriz/friendly-snippets'

  use { 'folke/trouble.nvim' }

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim' 
  use { 'miyase256/vim-ripgrep', branch = 'fix/remove-complete-from-RgRoot' }
  use { 
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }


  use 'kevinhwang91/rnvimr'

  use 'ahmedkhalf/project.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'Pocco81/auto-save.nvim'

  use 'phaazon/hop.nvim'
  use 'rktjmp/lush.nvim'

  use { 'NTBBloodbath/galaxyline.nvim' }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
    'nvim-lua/plenary.nvim'
    }
  }

  use 'glepnir/dashboard-nvim'
  use { 'kdheepak/lazygit.nvim', branch = 'main' } 

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'RRethy/nvim-treesitter-textsubjects'

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

 end
)

require('project_nvim').setup({
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git" }
})

--
--Gitsigns
--

require('gitsigns').setup({
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = "▎",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = "▎",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = "▎",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text =  "▎",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = "▎",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    numhl = false,
    linehl = false,
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 500,
    },
    word_diff = false,
    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end
      -- Navigation
      map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
      map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

      -- Actions
      map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
      map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
      map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
      map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
      map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
      map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
      map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
      map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
      map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
      map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
      map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
      map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

      -- Text object
      map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
})

vim.cmd([[
  augroup gitsigncolors
    autocmd ColorScheme * hi GitSignsChange guibg=#232731 guifg=#ebcb8b
    autocmd ColorScheme * hi GitSignsAdd guibg=#232731 guifg=#a3be8c
    autocmd ColorScheme * hi GitSignsDelete guibg=#232731 guifg=#bf616a
    autocmd ColorScheme * hi GitSignsCurrentLineBlame guifg=#3b4048
  augroup END
]])

--
--Telescope
--

local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_previous,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-p>"] = actions.select_default,
        ["<C-l>"] = actions.select_default,
        ["<C-j>"] = actions.move_selection_next,
        ["<c-t>"] = trouble.open_with_trouble,
        ["<c-d>"] = actions.move_selection_next + actions.move_selection_next + actions.move_selection_next + actions.move_selection_next,
        ["<c-u>"] = actions.move_selection_previous + actions.move_selection_previous + actions.move_selection_previous + actions.move_selection_previous,
        ["<c-t>"] = trouble.open_with_trouble,
      },
      n = {
        ["<C-n>"] = actions.move_selection_previous,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-p>"] = actions.select_default,
        ["<C-l>"] = actions.select_default,
        ["<C-j>"] = actions.move_selection_next,
        ["<c-t>"] = trouble.open_with_trouble,
        ["<c-d>"] = actions.move_selection_next + actions.move_selection_next + actions.move_selection_next + actions.move_selection_next,
        ["<c-u>"] = actions.move_selection_previous + actions.move_selection_previous + actions.move_selection_previous + actions.move_selection_previous,
      }
    },
    layout_config = {
      horizontal = {
        mirror = true,
      },
      vertical = {
        mirror = true,
      },
      prompt_position = "top",
    },
    file_ignore_patterns = { "node_modules", "/home/rufus/Dev/arbour/common" }, 
    sorting_strategy = "ascending"
  },
  pickers = {
    oldfiles = {
      sort_mru = true,
      cwd_only = false,
      prompt_title = false,
      previewer = false,
      results_height = 20,
      winblend = 20
    },
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
      sorter = require'telescope.sorters'.get_substr_matcher(),
      prompt_title = false,
      previewer = false,
      results_height = 20,
      winblend = 20,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    }
  },
  extensions = {
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*", "*/node_modules/*"},
      disable_devicons = false,
      workspaces = {
        ["mms"]    = home .. "/Dev/MediaMarkt"
      }
    }
  }
})

require('telescope').load_extension('projects')

--
--Treesitter
--
local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "all",
  ignore_install =  { "phpdoc", "elixir" },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true
  }
}

--
--LSP
--
local lspconfig = require'lspconfig'
local function custom_on_attach(client, bufnr)
  print('Attaching to ' .. client.name)
  local ts_utils = require("nvim-lsp-ts-utils")

  -- defaults
  ts_utils.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      -- lower numbers = higher priority
      import_all_priorities = {
          same_file = 1, -- add to existing import statement
          local_files = 2, -- git files or files with relative path markers
          buffer_content = 3, -- loaded buffer content
          buffers = 4, -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,
      -- if false will avoid organizing imports
      always_organize_imports = true,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",
      inlay_hints_priority = 200, -- priority of the hint extmarks
      inlay_hints_throttle = 150, -- throttle the inlay hint request
      inlay_hints_format = { -- format options for individual hint kind
          Type = {},
          Parameter = {},
          Enum = {},
          -- Example format customization for `Type` kind:
          -- Type = {
          --     highlight = "Comment",
          --     text = function(text)
          --         return "->" .. text:sub(2)
          --     end,
          -- },
      },

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = true,
      watch_dir = nil,
  }

  -- required to fix code action ranges
  ts_utils.setup_client(client)

  -- no default maps, so you may want to define some here
  local opts = {silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspImportCurrent<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
end

local default_config = {
  on_attach = custom_on_attach,
}
-- setup language servers here
lspconfig.tsserver.setup(default_config)
lspconfig.gopls.setup{}
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = home .. "./.ccls/ccls-cache";
    };
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

--
--Formatting
--
require("null-ls").setup({
    -- debug = true,
    sources = {
      require('null-ls').builtins.diagnostics.eslint,
      require('null-ls').builtins.code_actions.eslint,
      -- require("null-ls").builtins.formatting.prettier.with {
      --   filetypes = {
      --     "typescriptreact",
      --     "typescript",
      --     "javascriptreact",
      --     "javascript",
      --     "svelte",
      --     "json",
      --     "jsonc",
      --     "css",
      --     "html",
      --   },
      -- },
    }
})

--
--Treesitter Test Subjectsqh
--
require'nvim-treesitter.configs'.setup {
    textsubjects = {
        enable = true,
        keymaps = {
            [','] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
        }
    },
}

--
--Galaxyline
--
local gl = require('galaxyline') 

----
---- Cmp
----

local cmp = require'cmp'
cmp.setup({
 snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = 'vsnip' }
  }
})

--
--Autopairs
--
require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})

--
--AutoSave
--

require('auto-save').setup({
  enabled = true
})

--
--Hop
--
--
require('hop').setup({})

--
--Terminal
--

vim.cmd([[
  augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END
]])

--
--Statusline
--

local gl = require('galaxyline')
local hsl = require('lush').hsl
local gls = gl.section
local condition = require('galaxyline.condition')

table.insert(gls.left, {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,

    highlight = "StatusLineNC",
  }
})

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineGit",
  },
})

table.insert(gls.left, {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.left, {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = "StatusLineGitAdd",
  },
})

table.insert(gls.left, {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " 柳",
    highlight = "StatusLineGitChange",
  },
})

table.insert(gls.left, {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = "StatusLineGitDelete",
  },
})

table.insert(gls.right, {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = "StatusLineLspDiagnosticsError",
  },
})
table.insert(gls.right, {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",

    highlight = "StatusLineLspDiagnosticsWarning",
  },
})

table.insert(gls.right, {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",

    highlight = "StatusLineLspDiagnosticsInformation",
  },
})

table.insert(gls.right, {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",

    highlight = "StatusLineLspDiagnosticsHint",
  },
})


table.insert(gls.right, {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.right, {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = "StatusLineLspDiagnosticsError",
  },
})
table.insert(gls.right, {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = "StatusLineLspDiagnosticsWarning",
  },
})

table.insert(gls.right, {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = "StatusLineLspDiagnosticsInformation",
  },
})

--
--Dashboard
--
--


vim.cmd[[
  autocmd ColorScheme * hi DashboardHeader guifg=#ebcb8b
]]

local db = require('dashboard')

db.session_directory = home .. '/.config/sessions'
db.custom_header = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝'
} 

db.custom_center = {
    {icon = '  ',
    desc = 'Recently latest session                  ',
    shortcut = 'SPC d l',
    action ='SessionLoad'},
    {icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = '<C-p>'},
    {icon = '  ',
    desc ='File Browser                            ',
    action =  'RnvimrToggle',
    shortcut = '<C-r>'},
    {icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = '<C-f>'},
}

--vim.cmd("colorscheme lunaperche")
vim.cmd("colorscheme dracula")
vim.cmd("set noequalalways")
--vim.lsp.set_log_level("debug")
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
-- vim.cmd([[ autocmd VimEnter * Neotree | wincmd p ]])

-- vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   desc = "Open neo-tree on enter",
--   group = "neotree_autoopen",
--   callback = function()
--     if not vim.g.neotree_opened then
--       vim.cmd "Neotree buffers"
--       vim.g.neotree_opened = true
--     end
--   end,
-- })
