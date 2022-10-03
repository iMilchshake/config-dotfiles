-- Example config in lua

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_italic = true

-- vim.g.nord_enable_sidebar_background = true -- this kinda breaks the tree view

-- Load the colorscheme
require('nord').set()
