return {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function ()
                local ts = require('nvim-treesitter')
                ts.setup({
                        highlight = { enable = true },
                })
                ts.install { "c", "cpp", "go", "lua", "python", "rust", "vim", "vimdoc", "query", "odin", "glsl", "scss", "css", "html", "slang", "hlsl", "json", "json5" }

                vim.api.nvim_create_autocmd('FileType', {
                        pattern = { 'odin', 'c', 'cpp', 'lua', 'glsl', 'css', 'html', 'hlsl', 'rust' },
                        callback = function() vim.treesitter.start() end,
                })
        end
}
