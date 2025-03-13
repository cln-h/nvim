-- Reload config
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", { desc = "[F]ind in file [B]rowser" })
vim.keymap.set("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find({
    previewer = false,
    layout_strategy = "vertical",
    layout_config = {
      width = 0.5,
    },
  })
end, { desc = "[/] Fuzzily find in current buffer" })
vim.keymap.set("n", "<leader>f/", function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, { desc = "[F]ind [/] in Open Files" })
vim.keymap.set("n", "<leader>fn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config")})
end, { desc = "[F]ind [N]eovim configuration files" })

-- NvimTree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {}) -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {}) -- refresh
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file

-- Terminal
vim.keymap.set("n", "<leader>tt", ":NeotermToggle<CR>", {})
vim.keymap.set("n", "<leader>tx", ":NeotermExit<CR>", {})
