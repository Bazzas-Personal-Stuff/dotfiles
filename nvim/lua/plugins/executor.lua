return {
        "google/executor.nvim",
        dependencies = {
                "MunifTanjim/nui.nvim",
        },
        config = function()
                -- your setup here
                local executor = require("executor")
                executor.setup({
                        use_split = false,
                })
            
                local map = require("helpers.keys").map
                map("n", "<leader>r", function() require("executor").commands.run_one_off("reload") end, "Call 'reload' script")
                map("n", "<leader>b", function() require("executor").commands.run_one_off("run") end, "Call 'run' script")
                map("n", "<leader>cc", function() require("executor").commands.run() end, "Command run")
                map("n", "<leader>cs", function() require("executor").commands.set_command() end, "Command set")
                map("n", "<leader>cd", function() require("executor").commands.reset() end, "Command delete (reset)")

        end,
}
