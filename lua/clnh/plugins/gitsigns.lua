return {{
  -- Git integration for buffers
  "lewis6991/gitsigns.nvim",
  opts = {
      signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" }
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
          interval = 1000,
          follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
          delay = 1000,
          ignore_whitespace = false
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1
      }
  },
  config = function(_, opts)
      require("gitsigns").setup(opts)

      -- Set highlights
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
      vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
      vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' })
      vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
      vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
      vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' })
      vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
      vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' })
      vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
      vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
      vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' })
      vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })
      vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
      vim.api.nvim_set_hl(0, 'GitSignsUntracked', { link = 'GitSignsAdd' })
      vim.api.nvim_set_hl(0, 'GitSignsUntrackedNr', { link = 'GitSignsAddNr' })
      vim.api.nvim_set_hl(0, 'GitSignsUntrackedLn', { link = 'GitSignsAddLn' })
  end
}}
