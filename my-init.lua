
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

vim.g.dap_virtual_text = true

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
key_mapper('i', '<C-BS>', '<C-w>')
key_mapper('i', '<C-h>', '<C-w>')

key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<leader>k', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
key_mapper('n', '<leader>i', ':lua vim.lsp.buf.formatting_sync()<CR>')
key_mapper('n', '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>')
key_mapper('n', '<leader>dp', ':lua vim.diagnostic.goto_prev()<CR>')
key_mapper('n', '<leader>q', ':lua vim.diagnostic.setloclist()<CR>')

key_mapper('n', 'qq', ':TSToolsAddMissingImports<CR>')
key_mapper('n', 'to', ':TSToolsOrganizeImports<CR>')
key_mapper('n', 'ts', ':TSToolsSortImports<CR>')
key_mapper('n', 'tu', ':TSToolsRemoveUnusedImports<CR>')
key_mapper('n', 'ta', ':TSToolsRemoveUnused<CR>')
key_mapper('n', 'tf', ':TSToolsFixAll<CR>')
key_mapper('n', 'td', ':TSToolsGoToSourceDefinition<CR>')
key_mapper('n', 'tr', ':TSToolsRenameFile<CR>')

key_mapper('n', '<leader>xx', ':lua require("trouble").toggle()<CR>')
key_mapper('n', '<leader>xw', ':lua require("trouble").toggle("workspace_diagnostics")<CR>')
key_mapper('n', '<leader>xd', ':lua require("trouble").toggle("document_diagnostics")<CR>')
key_mapper('n', '<leader>xq', ':lua require("trouble").toggle("quickfix")<CR>')
key_mapper('n', '<leader>xl', ':lua require("trouble").toggle("loclist")<CR>')
key_mapper('n', 'gR', ':lua require("trouble").toggle("lsp_references")<CR>')

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

key_mapper('n', '<leader>c', '<cmd>lua require"dap".continue()<CR>')
key_mapper('n', '<leader>dc', '<cmd>lua require"dap".run_to_cursor()<CR>')
key_mapper('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
key_mapper('n', '<leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
key_mapper('n', '<leader>dg', '<cmd>lua require"dap-go".debug_test()<CR>')
key_mapper('n', '<leader>dr', '<cmd>lua require"dap-go".debug()<CR>')
key_mapper('n', '<leader>dc', '<cmd>lua require"dapui".close()<CR>')

key_mapper('n', '<leader>ds', '<cmd>lua require"dap".step_over()<CR>')
key_mapper('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>')
key_mapper('n', '<leader>do', '<cmd>lua require"dap".step_out()<CR>')

key_mapper('n', '<leader>du', '<cmd>lua require"dap.ui.widgets".scopes()<CR>')
key_mapper('n', '<leader>dh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')

--key_mapper('n', '<leader>gr', ':Qfreplace<CR>')
-- key_mapper('v', '<leader>du', '<cmd>lua require"dap.ui.widgets".visual_hover()<CR>')

-- key_mapper('n', '<leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")
-- key_mapper('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- key_mapper('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
-- key_mapper('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')

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

  use 'christianchiarulli/nvcode-color-schemes.vim' 
  use { "catppuccin/nvim", as = "catppuccin" }
  
  use 'kyazdani42/nvim-web-devicons'
  
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'

  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  --use "hrsh7th/cmp-nvim-lua"
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
  -- use {
  --   'creativenull/efmls-configs-nvim',
  --   tag = 'v1.*', -- tag is optional, but recommended
  --   requires = { 'neovim/nvim-lspconfig' },
  -- }

  -- use {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v3.x',
  --   requires = {
  --     --- Uncomment these if you want to manage LSP servers from neovim
  --     -- {'williamboman/mason.nvim'},
  --     -- {'williamboman/mason-lspconfig.nvim'},

  --     -- LSP Support
  --     {'neovim/nvim-lspconfig'},
  --     -- Autocompletion
  --     {'hrsh7th/nvim-cmp'},
  --     {'hrsh7th/cmp-nvim-lsp'},
  --     {'L3MON4D3/LuaSnip'},
  --   }
  -- }
  use {
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup {}
    end,
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

  use { 'kdheepak/lazygit.nvim', branch = 'main' } 

  use 'RRethy/nvim-treesitter-textsubjects'

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  use 'mfussenegger/nvim-dap'
  use {'nvim-telescope/telescope-dap.nvim'}
  use {'theHamsta/nvim-dap-virtual-text'}
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'

  use 'nicwest/vim-camelsnek'
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
    file_ignore_patterns = { "node_modules", "term://" }, 
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
  ensure_installed = { "c", "lua", "vim", "javascript", "typescript", "html", "terraform", "yaml", "dockerfile", "bash", "markdown", "tsx", "glimmer", "xml", "json", "make", "purescript", "go", "cpp", "gomod" },
  ignore_install =  { "phpdoc", "elixir" },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true
  }
}

--
--Treesitter Test Subjects
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
-- LSP
--
--

local api = require("typescript-tools.api")
require("typescript-tools").setup {
  -- handlers = {
  --   ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
  --     -- Ignore 'This may be converted to an async function' diagnostics.
  --     { 80006 }
  --   ),
  -- },
}

local lspconfig = require("lspconfig")

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
-- Dap
-- 
local dap = require('dap')
local dapui = require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require('dap-go').setup({
  on_attach = function()
  end
})

dapui.setup({
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
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
  enabled = true,
  debounce_delay = 135
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

-- vim.cmd[[
--   autocmd ColorScheme * hi DashboardHeader guifg=#ebcb8b
-- ]]

vim.cmd("colorscheme catppuccin")
-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

--vim.cmd("colorscheme lunaperche")
-- vim.cmd("colorscheme dracula")
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
