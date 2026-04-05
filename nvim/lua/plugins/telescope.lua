return {
    'nvim-telescope/telescope.nvim', version = '*',
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

        -- WINDOWS ONLY - assumes ODIN_DIR is C:\dev\lib\odin
        map("n", "<leader>oo", function() require("helpers.telescopePickers").prettyFilesPicker({picker = 'find_files', options = {cwd = 'C:\\dev\\lib\\odin\\'}}) end, "Find Odin package file")
        map("n", "<leader>ob", function() require("helpers.telescopePickers").prettyFilesPicker({picker = 'find_files', options = {cwd = 'C:\\dev\\lib\\odin\\builtin\\'}}) end, "Find Odin Builtin package file")
        map("n", "<leader>oc", function() require("helpers.telescopePickers").prettyFilesPicker({picker = 'find_files', options = {cwd = 'C:\\dev\\lib\\odin\\core\\'}}) end, "Find Odin Core package file")
        map("n", "<leader>ov", function() require("helpers.telescopePickers").prettyFilesPicker({picker = 'find_files', options = {cwd = 'C:\\dev\\lib\\odin\\vendor\\'}}) end, "Find Odin Vendor package file")

    end,
}













