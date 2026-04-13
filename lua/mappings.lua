require "nvchad.mappings"

-- Remove NvChad defaults that conflict with AstroNvim-style mappings
local nomap = vim.keymap.del

-- <leader>x : NvChad=close buffer, Astro=quickfix/lists prefix
nomap("n", "<leader>x")
-- <leader>b : NvChad=new buffer, Astro=buffers prefix
nomap("n", "<leader>b")
-- <leader>n : NvChad=toggle line number, Astro=new file
nomap("n", "<leader>n")
-- <leader>rn : NvChad=toggle relative number (moved to <leader>un)
nomap("n", "<leader>rn")
-- <leader>h : NvChad=new horizontal term (replaced by toggleterm)
nomap("n", "<leader>h")
-- <leader>v : NvChad=new vertical term (replaced by toggleterm)
nomap("n", "<leader>v")
-- <leader>th : NvChad=themes (moved to <leader>ft)
nomap("n", "<leader>th")
-- <leader>fm : NvChad=format (moved to <leader>lf). Note: NvChad sets this for n and v.
nomap("n", "<leader>fm")
-- <leader>ma : NvChad=marks (moved to <leader>f')
nomap("n", "<leader>ma")
-- <leader>cm : NvChad=git commits (moved to <leader>gc)
nomap("n", "<leader>cm")
-- <leader>ds : NvChad=diagnostic loclist (moved to <leader>lD / <leader>ld)
nomap("n", "<leader>ds")
-- <leader>pt : NvChad=pick hidden term (replaced by toggleterm)
nomap("n", "<leader>pt")
-- NvChad term toggles (replaced by toggleterm)
nomap({ "n", "t" }, "<A-v>")
nomap({ "n", "t" }, "<A-h>")
nomap({ "n", "t" }, "<A-i>")
-- NvChad window navigation (replaced by smart-splits with wrap-around)
nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-l>")

-- Load all mapping modules
require "mappings.general"
require "mappings.buffers"
require "mappings.lsp"
require "mappings.telescope"
require "mappings.terminal"
require "mappings.ui_toggles"
require "mappings.quickfix"
require "mappings.window_mappings"

-- Note: mappings/git.lua exports an on_attach function used by gitsigns plugin config
