-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.termguicolors = true

local spec = {{
  import = "plugins"
}}

require("lazy").setup({
  root = vim.fn.stdpath("data") .. "/lazy",
  spec = spec,
  lockfile = vim.fn.stdpath("config") .. "/.lazy.lock",
  defaults = {
    -- enable lazy loading of plugins
    lazy = false,
    version = nil,
  },
  install = {
    -- install missing plugins
    missing = true,
    colorscheme = {"rose-pine", "habamax"},
  },
  checker = {
    -- check for plugin updates
    enabled = true,
    -- notifcation when plugin updates are available
    notify = false,
  },
  change_detection = {
    -- check for config changes and reload ui
    enabled = true,
    -- notifcation when changes are found
    notify = false,
    -- how often to check for updates
    frequency = 86400,
  }
  performance = {
    cache = {
      enabled = true
    }
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json",
})

local modules = {"config.autocmds", "config.options", "config.keymaps"}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  if not ok then
    error(("Error loading %s...\n\n%s"):format(mod, err))
  end
end

-- disable deprecated messages
vim.deprecate = function end()
