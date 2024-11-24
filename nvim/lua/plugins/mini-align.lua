return {
    { 
        'echasnovski/mini.nvim', 
        version = false,
        config = function()
            local align = require("mini.align")
            align.setup({
                options = {
                    merge_delimiter = ' ',
                },
                steps = {
                    pre_justify = { 
                        align.gen_step.trim('both', 'keep'),
                        align.gen_step.filter('n == 1'),
                    },
                    merge = align.gen_step.default_merge(' '),
                    
                },
            })
        end,
    }
}
