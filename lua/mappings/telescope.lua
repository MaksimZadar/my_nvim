-- Telescope / Finder (AstroNvim-style)
-- NvChad already provides: <leader>ff, <leader>fw, <leader>fb, <leader>fh, <leader>fo, <leader>fa, <leader>fz
-- These are ADDITIONAL Astro-style finder mappings
local map = vim.keymap.set

-- Resume previous search
map("n", "<Leader>f<CR>", function()
  require("telescope.builtin").resume()
end, { desc = "Resume previous search" })

-- Find word under cursor
map("n", "<Leader>fc", function()
  require("telescope.builtin").grep_string()
end, { desc = "Find word under cursor" })

-- Find commands
map("n", "<Leader>fC", function()
  require("telescope.builtin").commands()
end, { desc = "Find commands" })

-- Find all files (hidden + no ignore)
map("n", "<Leader>fF", function()
  require("telescope.builtin").find_files { hidden = true, no_ignore = true }
end, { desc = "Find all files" })

-- Find git files
map("n", "<Leader>fg", function()
  require("telescope.builtin").git_files()
end, { desc = "Find git files" })

-- Find keymaps
map("n", "<Leader>fk", function()
  require("telescope.builtin").keymaps()
end, { desc = "Find keymaps" })

-- Find man pages
map("n", "<Leader>fm", function()
  require("telescope.builtin").man_pages()
end, { desc = "Find man pages" })

-- Find registers
map("n", "<Leader>fr", function()
  require("telescope.builtin").registers()
end, { desc = "Find registers" })

-- Find marks (relocated from NvChad's <leader>ma)
map("n", "<Leader>f'", function()
  require("telescope.builtin").marks()
end, { desc = "Find marks" })

-- Find themes/colorschemes (relocated from NvChad's <leader>th)
map("n", "<Leader>ft", function()
  require("nvchad.themes").open()
end, { desc = "Find themes" })

-- Find in current buffer (alias -- NvChad has <leader>fz, Astro uses <leader>fl)
map("n", "<Leader>fl", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Find lines in buffer" })

-- Git commits (relocated from NvChad's <leader>cm)
map("n", "<Leader>gc", function()
  require("telescope.builtin").git_commits()
end, { desc = "Git commits (repo)" })

-- Git commits for current file
map("n", "<Leader>gC", function()
  require("telescope.builtin").git_bcommits()
end, { desc = "Git commits (current file)" })
