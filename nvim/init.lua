vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Handle plugins with lazy.nvim
require("core.lazy")

-- General Neovim keymaps
require("core.keymaps")

-- Other options
require("core.options")
