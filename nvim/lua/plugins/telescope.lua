return {
    -- 'nvim-telescope/telescope.nvim', tag = '0.1.3',
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require("telescope").setup{
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
        }

        local map = require("helpers.keys").map
        map("n", "<leader>p", function() require("helpers.telescopePickers").prettyFilesPicker({picker = 'find_files'}) end, "Find project file")
        map("n", "<leader>f", function() require("helpers.telescopePickers").prettyGrepPicker({picker = 'live_grep'}) end, "Find string")
        map("n", "<leader>g", function() require("telescope.builtin").lsp_workspace_symbols() end, "Search symbols in workspace")
        map("n", "<leader>d", function() require("telescope.builtin").lsp_diagnostics() end, "Search diagnostics")

    end,
}













