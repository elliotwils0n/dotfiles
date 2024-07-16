return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Mason
        'williamboman/mason.nvim',
        "williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        -- Snippets
        'L3MON4D3/LuaSnip',
    },
    config = function()
        -- Setup language servers.
        local servers = {
            rust_analyzer = {},
            gopls = {},
            pyright = {},
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}
                        }
                    }
                }
            },
        }
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require("lspconfig")

        for name, config in pairs(servers) do
            config = vim.tbl_deep_extend("force", {}, {
                capabilities = capabilities,
            }, config)
            lspconfig[name].setup(config)
        end

        -- Setup Mason.
        local ensure_installed = { "delve" }
        vim.list_extend(ensure_installed, vim.tbl_keys(servers))

        require("mason").setup()
        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed
        })

        -- Setup completion.
        local cmp = require "cmp"
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {},
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources(
                {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                {
                    { name = 'buffer' },
                }
            )
        })

        -- Setup mappings.
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                local opts = { buffer = ev.buf }

                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end,
}
