-- hier sind einige generelle nvim einstellungen

vim.wo.number = true

vim.opt.termguicolors = true
-- Set color scheme to gruvbox
vim.cmd([[colorscheme tokyonight-night]])

require("transparent").clear_prefix("BufferLine")
require("transparent").clear_prefix("NvimTree")
