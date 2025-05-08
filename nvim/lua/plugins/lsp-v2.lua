return {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
                {'mason-org/mason.nvim'},
                {'neovim/nvim-lspconfig'},

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},     -- Required
                {'hrsh7th/cmp-nvim-lsp'}, -- Required
                {'L3MON4D3/LuaSnip'},     -- Required

                -- Signature help
                {'ray-x/lsp_signature.nvim'},
        },

        config = function()
                vim.api.nvim_create_autocmd('LspAttach', {
                        group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
                        callback = function(event)
                                local opts = {buffer = event.buf}
                                local lsp_sig = require('lsp_signature')
                                lsp_sig.on_attach({
                                        bind = true,
                                        handler_opts = {
                                                border = "rounded",
                                        },
                                }, event.buf)

                                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                                vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover({buffer = 'rounded'}) end, opts)
                                vim.keymap.set("n", "gx", function() vim.diagnostic.open_float() end, opts)
                                vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
                        end,
                })

                require("mason").setup({
                        ui = {
                                icons = {
                                        package_installed = "✓",
                                        package_pending = "➜",
                                        package_uninstalled = "✗"
                                }
                        }
                })

                local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

                require('mason-lspconfig').setup({
                        ensure_installed = {
                                'ols',
                                'clangd',
                                'ruff',
                                -- 'slang',
                        },

                        handlers = {
                                function(server_name)
                                        require('lspconfig')[server_name].setup({
                                                capabilities = lsp_capabilities,
                                        })
                                end,
                        }
                })


                -- Set up diagnostic signs
                local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
                for type, icon in pairs(signs) do
                        local hl = "DiagnosticSign" .. type
                        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
                end

                local diag_config = {
                        virtual_text = false,
                        signs = {
                                active = signs,
                        },
                        update_in_insert = true,
                        underline = true,
                        severity_sort = true,
                        float = {
                                focusable = true,
                                style = "minimal",
                                border = "rounded",
                                source = "always",
                                header = "",
                                prefix = "",
                        },
                }
                vim.diagnostic.config(diag_config)

                -- Code completion
                local cmp = require('cmp')
                local cmp_select = {behavior = cmp.SelectBehavior.Select}

                cmp.setup({
                        sources = cmp.config.sources({
                                {name = 'nvim_lsp'},
                                {name = 'nvim_lsp_signature_help'},
                                {name = 'luasnip'},
                        }, {
                                {name = 'buffer'},
                        }),

                        mapping = cmp.mapping.preset.insert({
                            ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
                            ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
                            ['<Tab>'] = cmp.mapping.confirm({select = true}),
                            ['<C-Space>'] = cmp.mapping.complete(),
                        }),

                        snippet = {
                                expand = function(args)
                                        require('luasnip').lsp_expand(args.body)
                                end,
                        },

                        window = {
                                completion = cmp.config.window.bordered(),
                                documentation = cmp.config.window.bordered(),
                        },
                })
        end,
}
