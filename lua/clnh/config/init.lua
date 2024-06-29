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
  root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
  spec = spec,
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
  defaults = {
      lazy = false,
      version = nil
      -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
  install = {
      -- install missing plugins on startup
      missing = true,
      -- try to load one of these colorschemes when starting an installation during startup
      colorscheme = {"rose-pine", "habamax"}
  },
  checker = {
      -- automatically check for plugin updates
      enabled = true,
      -- get a notification when new updates are found
      notify = false,
      -- check for updates every day
      frequency = 86400
  },
  change_detection = {
      -- automatically check for config file changes and reload the ui
      enabled = true,
      -- get a notification when changes are found
      notify = false
  },
  performance = {
      cache = {
          enabled = true
      }
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json" -- state info for checker and other things
})

local modules = {"clnh.config.autocmds", "clnh.config.options", "clnh.config.keymaps"}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  if not ok then
    error(("Error loading %s...\n\n%s"):format(mod, err))
  end
end

-- disable deprecated messages
vim.deprecate = function() end
