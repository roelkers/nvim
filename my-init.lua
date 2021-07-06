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
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
key_mapper('n', '<leader>i', ':lua vim.lsp.buf.formatting_sync()<CR>')
key_mapper('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
key_mapper('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
key_mapper('', '<C-p>', ':lua require"telescope.builtin".find_files({ search_dirs = { "/home/rufus/Dev" } })<CR>')
key_mapper('', '<C-f>', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
key_mapper('', '<C-c>', ':lua require"telescope.builtin".buffers()<CR>')
key_mapper('', '<C-g>', ':lua require"telescope.builtin".grep_string({ search=vim.fn.input("Grep for >") })<CR>')
key_mapper('', '<C-e>', ':lua require"telescope.builtin".lsp_workspace_diagnostics()<CR>')
key_mapper('', '<leader>fa', ':lua require"telescope.builtin".lsp_range_code_actions()<CR>')
key_mapper('', '<leader>gc', ':lua require"telescope.builtin".git_commits()<CR>')
key_mapper('', '<leader>gb', ':lua require"telescope.builtin".git_branches()<CR>')
key_mapper('', '<leader>gs', ':lua require"telescope.builtin".git_status()<CR>')
key_mapper('', '<leader>o', ':lua require"telescope.builtin".oldfiles()<CR>')
key_mapper('n', 's', ':HopWord<CR>')
key_mapper('n', '<leader>dt', ':Gitsigns diffthis<CR>')

--
--Auto commands
--

--vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

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
  use 'tjdevries/colorbuddy.nvim'
  
  use 'kyazdani42/nvim-web-devicons'
  
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'

  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'


  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  use 'kevinhwang91/rnvimr'

  use 'ygm2/rooter.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'Pocco81/AutoSave.nvim'

  use 'phaazon/hop.nvim'

  use 'rktjmp/lush.nvim'

  use { 'glepnir/galaxyline.nvim' }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
    'nvim-lua/plenary.nvim'
    }
  }

 end
)

--
--Gitsigns
--

require('gitsigns').setup({
    numhl = false,
    linehl = false,
    current_line_blame = true,
    current_line_blame_delay = 500,
    word_diff = false
})

--
--Telescope
--
--
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_previous,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-p>"] = actions.move_selection_next,
        ["<C-j>"] = actions.move_selection_next,
      },
      n = {
        ["<C-n>"] = actions.move_selection_previous,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-p>"] = actions.move_selection_next,
        ["<C-j>"] = actions.move_selection_next,
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
    file_ignore_patterns = { "node_modules" }, 
    sorting_strategy = "ascending"
  },
  pickers = {
    live_grep = {
      previewer = false
    },
    find_files = {
      previewer = false,
    },
    oldfiles = {
      include_current_session = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      cwd_only = false 
    },
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- or right hand side can also be a the name of the action as string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

--
--Treesitter
--
local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "maintained",
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
local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
end
local default_config = {
  on_attach = custom_on_attach,
}
-- setup language servers here
lspconfig.tsserver.setup(default_config)

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

--
--Compe
--

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})

--
--Autopairs
--
require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})

--
--AutoSave
--

require('autosave').setup({
  enabled = true
})

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
--Colorscheme
--

local Color, colors, Group, groups, styles = require'colorbuddy'.setup()
local none = styles.NONE
local bold = styles.bold
local italic = styles.italic
local underline = styles.underline
local vim = vim

vim.g.colors_name='gloombuddy'

---------------------
-- COLORS
---------------------

-- Background
Color.new('bg_1',       '#212136')
Color.new('bg_2',       '#292a44')
Color.new('bg_3',       '#363759')
Color.new('bg_4',       '#626483')

-- Foreground
Color.new('fg_1',       '#f8fafd')
Color.new('fg_2',       '#f1eff7')
Color.new('fg_3',       '#d7dae0')
Color.new('fg_4',       '#6b717d')

-- Reds
Color.new('red_1',      '#ff6f9f')
Color.new('red_2',      '#ed4781')
Color.new('red_3',      '#f92672')
Color.new('red_4',      '#f44747')

-- Greens
Color.new('green_1',    '#94f2e7')
Color.new('green_2',    '#6dfedf')
Color.new('green_3',    '#2de0a7')

-- Blues
Color.new('blue_1',     '#7aa5ff')
Color.new('blue_2',     '#678bdc')

-- Purples
Color.new('purple_1',     '#ae81ff')
Color.new('purple_2',     '#6d6db5')

-- Yellows
Color.new('yellow_1',   '#ffdb7d')
Color.new('yellow_2',   '#e5c07b')

-- Greys
Color.new('grey_1',     '#bbbbbb')

---------------------
-- HIGHLIGHTS
---------------------

-- {{ Vim
Group.new('Bold',                       colors.none,        colors.none,              bold)
Group.new('ColorColumn',                colors.none,        colors.bg_4,              none)
Group.new('Conceal',                    colors.bg_4,        colors.none,              none)
Group.new('Cursor',                     colors.none,        colors.red_1,             none)
Group.new('CursorColumn',               colors.none,        colors.bg_1,              none)
Group.new('CursorLine',                 colors.none,        colors.bg_1,              none)
Group.new('CursorLineNr',               colors.fg_2,        colors.bg_4,              none)
Group.new('Debug',                      colors.none,        colors.none,              none)
Group.new('Directory',                  colors.red_1,       colors.none,              none)
Group.new('EndOfBuffer',                colors.bg_2,        colors.none,              none)
Group.new('Error',                      colors.red_4,       colors.fg_2,              bold)
Group.new('ErrorMsg',                   colors.red_4,       colors.fg_2,              none)
Group.new('Exception',                  colors.red_4,       colors.none,              none)
Group.new('FoldColumn',                 colors.fg_4,        colors.none,              none)
Group.new('Folded',                     colors.bg_4,        colors.none,              none)
Group.new('Ignore',                     colors.none,        colors.none,              none)
Group.new('IncSearch',                  colors.bg_1,        colors.fg_3,              none)
Group.new('Italic',                     colors.none,        colors.none,              italic)
Group.new('LineNr',                     colors.fg_4,        colors.none,              none)
Group.new('Macro',                      colors.none,        colors.none,              none)
Group.new('MatchParen',                 colors.yellow_1,    colors.none,              underline + bold)
Group.new('ModeMsg',                    colors.fg_2,        colors.none,              none)
Group.new('MoreMsg',                    colors.bg_4,        colors.none,              none)
Group.new('NonText',                    colors.bg_4,        colors.none,              none)
Group.new('Normal',                     colors.fg_2,        colors.bg_2,              none)
Group.new('Pmenu',                      colors.fg_3,        colors.bg_1,              none)
Group.new('PmenuSbar',                  colors.none,        colors.bg_3,              none)
Group.new('PmenuSel',                   colors.none,        colors.bg_4,              none)
Group.new('PmenuThumb',                 colors.none,        colors.bg_4,              none)
Group.new('PreCondit',                  colors.blue_2,      colors.none,              none)
Group.new('Question',                   colors.fg_2,        colors.none,              one)
Group.new('Search',                     colors.bg_1,        colors.yellow_1,          none)
Group.new('SignColumn',                 colors.none,        colors.none,              none)
Group.new('Special',                    colors.blue_1,      colors.none,              none)
Group.new('SpecialComment',             colors.none,        colors.none,              none)
Group.new('SpecialKey',                 colors.yellow_1,    colors.none,              none)
Group.new('StatusLine',                 colors.fg_2,        colors.bg_3,              none)
Group.new('StatusLineNC',               colors.fg_4,        colors.bg_1,              none)
Group.new('TabLine',                    colors.fg_4,        colors.bg_1,              none)
Group.new('TabLineFill',                colors.fg_2,        colors.bg_2,              none)
Group.new('TabLineSel',                 colors.fg_2,        colors.bg_3,              none)
Group.new('Title',                      colors.fg_2,        colors.bg_4,              none)
Group.new('TooLong',                    colors.red_4,       colors.none,              none)
Group.new('Underlined',                 colors.none,        colors.none,              underline)
Group.new('VertSplit',                  colors.bg_1,        colors.bg_1,              none)
Group.new('Visual',                     colors.none,        colors.fg_4,              none)
Group.new('VisualNOS',                  colors.none,        colors.fg_4,              none)
Group.new('WarningMsg',                 colors.red_4,       colors.none,              none)
Group.new('WildMenu',                   colors.fg_2,        colors.bg_3,              none)
Group.new('helpCommand',                colors.green_1,     colors.none,              none)
Group.new('helpExample',                colors.fg_4,        colors.none,              none)
Group.new('helpHeader',                 colors.red_2,       colors.none,              bold)
Group.new('helpSectionDelim',           colors.bg_4,        colors.none,              none)
Group.new('helpHyperTextEntry',         colors.green_1,     colors.none,              none)
Group.new('helpHyperTextJump',          colors.blue_2,      colors.none,              none)
Group.new('helpOption',                 colors.blue_1,      colors.none,              none)
-- }}

-- {{ Standard Syntax
Group.new('Boolean',                    colors.purple_1,    colors.none,              none)
Group.new('Character',                  colors.red_2,       colors.none,              none)
Group.new('Comment',                    colors.bg_4,        colors.none,              italic) -- (or purple_2) 
Group.new('Conditional',                colors.blue_1,      colors.none,              none)
Group.new('Constant',                   colors.purple_1,    colors.none,              none)
Group.new('Define',                     colors.blue_2,      colors.none,              none)
Group.new('Delimiter',                  colors.none,        colors.none,              none)
Group.new('Float',                      colors.yellow_2,    colors.none,              none)
Group.new('Function',                   colors.green_3,     colors.none,              none)
Group.new('Identifier',                 colors.red_2,       colors.none,              none) -- not sure
Group.new('Include',                    colors.blue_2,      colors.none,              none)
Group.new('Keyword',                    colors.red_2,       colors.none,              none)
Group.new('Label',                      colors.purple_1,    colors.none,              none)
Group.new('Number',                     colors.yellow_2,    colors.none,              none)
Group.new('Operator',                   colors.none,        colors.none,              none)
Group.new('PreProc',                    colors.blue_2,      colors.none,              none)
Group.new('Repeat',                     colors.blue_1,      colors.none,              none)
Group.new('SpecialChar',                colors.none,        colors.none,              none)
Group.new('Statement',                  colors.green_2,     colors.none,              none)
Group.new('StorageClass',               colors.yellow_2,    colors.none,              none)
Group.new('String',                     colors.green_2,     colors.none,              none)
Group.new('Structure',                  colors.yellow_2,    colors.none,              none)
Group.new('Substitute',                 colors.yellow_1,    colors.fg_2,              bold)
Group.new('Tag',                        colors.none,        colors.none,              none)
Group.new('Todo',                       colors.yellow_2,    colors.none,              none)
Group.new('Type',                       colors.blue_1,      colors.none,              none)
Group.new('Typedef',                    colors.blue_1,      colors.none,              none)
-- }}

-- Treesitter {{
Group.new('TSAnnotation',               colors.blue_1,      colors.none,              none)
Group.new('TSAttribute',                colors.red_1,       colors.none,              none)
Group.new('TSBoolean',                  colors.purple_1,    colors.none,              none)
Group.new('TSCharacter',                colors.red_2,       colors.none,              none)
Group.new('TSConditional',              colors.blue_1,      colors.none,              none)
Group.new('TSConstant',                 colors.purple_1,    colors.none,              none)
Group.new('TSConstBuiltin',             colors.purple_1,    colors.none,              none)
Group.new('TSConstMacro',               colors.purple_1,    colors.none,              none)
Group.new('TSConstructor',              colors.blue_2,      colors.none,              none)
Group.new('TSEmphasis',                 colors.purple_1,    colors.none,              none)
Group.new('TSError',                    colors.red_4,       colors.none,              none)
Group.new('TSException',                colors.blue_1,      colors.none,              none)
Group.new('TSField',                    colors.purple_1,    colors.none,              none)
Group.new('TSFloat',                    colors.yellow_2,    colors.none,              none)
Group.new('TSFunction',                 colors.green_3,     colors.none,              none)
Group.new('TSFuncBuiltin',              colors.blue_2,      colors.none,              none)
Group.new('TSFuncMacro',                colors.purple_1,    colors.none,              none)
Group.new('TSInclude',                  colors.blue_2,      colors.none,              none)
Group.new('TSKeyword',                  colors.red_2,       colors.none,              none)
Group.new('TSKeywordFunction',          colors.blue_1,      colors.none,              none)
Group.new('TSKeywordOperator',          colors.blue_1,      colors.none,              none)
Group.new('TSLabel',                    colors.purple_1,    colors.none,              none)
Group.new('TSLiteral',                  colors.fg_2,        colors.none,              none)
Group.new('TSMethod',                   colors.green_3,     colors.none,              none)
Group.new('TSNamespace',                colors.red_1,       colors.none,              none)
Group.new('TSNumber',                   colors.yellow_2,    colors.none,              none)
Group.new('TSOperator',                 colors.fg_2,        colors.none,              none)
Group.new('TSParameter',                colors.red_1,       colors.none,              none)
Group.new('TSParameterReference',       colors.red_1,       colors.none,              none)
Group.new('TSProperty',                 colors.red_1,       colors.none,              none)
Group.new('TSPunctBracket',             colors.grey_1,        colors.none,              none)
Group.new('TSPunctDelimiter',           colors.grey_1,        colors.none,              none)
Group.new('TSPunctSpecial',             colors.grey_1,        colors.none,              none)
Group.new('TSRepeat',                   colors.blue_1,      colors.none,              none)
Group.new('TSString',                   colors.green_2,     colors.none,              none)
Group.new('TSStringEscape',             colors.green_2,     colors.none,              none)
Group.new('TSStringRegex',              colors.green_2,     colors.none,              none)
Group.new('TSStrong',                   colors.purple_1,    colors.none,              none)
Group.new('TSStructure',                colors.blue_2,      colors.none,              none)
Group.new('TSTag',                      colors.blue_1,      colors.none,              none)
Group.new('TSTagDelimiter',             colors.blue_1,      colors.none,              none)
Group.new('TSText',                     colors.fg_2,        colors.none,              none)
Group.new('TSTitle',                    colors.green_3,     colors.none,              none)
Group.new('TSType',                     colors.blue_1,      colors.none,              none)
Group.new('TSTypeBuiltin',              colors.blue_2,      colors.none,              none)
Group.new('TSUnderline',                colors.fg_2,        colors.none,              none)
Group.new('TSURI',                      colors.green_2,     colors.none,              none)
Group.new('TSVariable',                 colors.purple_1,    colors.none,              none)
Group.new('TSVariableBuiltin',          colors.blue_1,      colors.none,              none)
-- }}

---- LSP {{
Group.new("LspDiagnosticsDefaultHint", colors.green_2)
Group.new("LspDiagnosticsDefaultError", colors.red_4)
Group.new("LspDiagnosticsDefaultWarning", colors.blue_1)
Group.new("LspDiagnosticsDefaultInformation", colors.fg_2)
-- }}

---- Telescope {{
Group.new("TelescopeBorder", colors.bg_4)
Group.new("TelescopeNormal", colors.fg_1)
Group.new("TelescopeSelection", colors.none, colors.bg_1)
Group.new("TelescopeMatching", colors.yellow_1)
-- }}

---- Diff {{
Group.new('DiffAdd',                    colors.green_1,     colors.bg_4,       none)
Group.new('DiffChange',                 colors.blue_2,      colors.fg_4,       none)
Group.new('DiffDelete',                 colors.red_4,       colors.fg_4,       none)
Group.new('DiffText',                   colors.fg_2,        colors.fg_4,       none)
Group.new('DiffAdded',                  colors.green_1,     colors.fg_4,       none)
Group.new('DiffFile',                   colors.red_4,       colors.fg_4,       none)
Group.new('DiffNewFile',                colors.green_1,     colors.fg_4,       none)
Group.new('DiffLine',                   colors.fg_2,        colors.fg_4,       none)
Group.new('DiffRemoved',                colors.red_4,       colors.fg_4,       none)
---- }}

---- Typescript {{
Group.new("typescriptdecorators",       colors.green_3, colors.none, none)
---- }}n
