local opts = {
	shiftwidth = 8,
	tabstop = 8,
	expandtab = true,
	wrap = false,
	termguicolors = true,
	number = true,

        scrolloff = 7,
        sidescrolloff = 7,

        shell = "nu",
        shellcmdflag = "-c",
        shellquote = "",
        shellxquote = "",
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
vim.g.nord_italic   = false
vim.g.nord_bold     = false


local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
