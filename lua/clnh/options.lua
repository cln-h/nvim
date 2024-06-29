local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local s = vim.s

local indent = 4

cmd([[
	filetype plugin indent on
]])

opt.backspace = {"eol", "start", "indent"} -- allow backspacing over everything in insert mode
opt.clipboard = "unnamedplus" -- allow neovim to access the system clipboard
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
opt.encoding = "utf-8" -- the encoding
opt.matchpairs = {"(:)", "{:}", "[:]", "<:>"}
opt.syntax = "enable"

-- indentation
opt.autoindent = true -- auto indentation
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = indent -- the number of spaces inserted for each indentation
opt.smartindent = true -- make indenting smarter
opt.softtabstop = indent -- when hitting <BS>, pretend like a tab is removed, even if spaces
opt.tabstop = indent -- insert 2 spaces for a tab
opt.shiftround = true -- use multiple of shiftwidth when indenting with "<" and ">"

-- search
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case
opt.wildignore = opt.wildignore + {"*/node_modules/*", "*/.git/*" }
opt.wildmenu = true -- make tab completion for files/buffers act like bash

opt.cursorline = true -- highlight the current line
opt.laststatus = 2 -- only the last window will always have a status line
opt.lazyredraw = true -- don"t update the display while executing macros
opt.list = true
opt.listchars = {
    tab = "┊ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "×"
}

-- Hide cmd line
opt.cmdheight = 0

opt.mouse = "a" -- allow the mouse to be used in neovim
opt.scrolloff = 18 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 3 -- minimal number of screen columns to keep to the left and right (horizontal) of the cursor if wrap is `false`
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.splitbelow = true -- open new split below
opt.splitright = true -- open new split to the right
opt.wrap = false -- display a long line

-- backups
opt.backup = false -- create a backup file
opt.swapfile = false -- creates a swapfile
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- autocomplete
opt.completeopt = {"menu", "menuone", "noselect"} -- mostly just for cmp
opt.shortmess = opt.shortmess + {
    c = true
} -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"

opt.showmode = false

-- perfomance
-- remember N lines in history
opt.history = 100 -- keep 100 lines of history
opt.redrawtime = 1500
opt.timeoutlen = 250 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeoutlen = 10
opt.updatetime = 100 -- signify default updatetime 4000ms is not good for async update

-- theme
opt.termguicolors = true -- enable 24-bit RGB colors

-- Check if undo directory exists; create if not
local undodir = vim.fn.stdpath("data") .. "/undo"
local function ensure_undo_dir()
  local cmd = string.format("silent !mkdir -p %s", vim.fn.shellescape(undodir))
  vim.api.nvim_command(cmd)
end

-- Create undo directory if it doesn't exist
ensure_undo_dir()

-- persistent undo
opt.undofile = true -- enable persistent undo
opt.undodir = undodir
opt.undolevels = 1000
opt.undoreload = 10000

-- fold
opt.foldmethod = "marker"
opt.foldlevel = 99

-- Disable builtin plugins
local disabled_built_ins = {"2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw", "netrwPlugin",
                            "netrwSettings", "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper",
                            "spellfile_plugin", "vimball", "vimballPlugin", "zip", "zipPlugin", "tutor", "rplugin",
                            "synmenu", "optwin", "compiler", "bugreport", "ftplugin"}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-- Colorscheme
cmd.colorscheme("rose-pine")