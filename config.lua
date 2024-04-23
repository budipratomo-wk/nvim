--=============================================================================
--INITIALIZATIONS
--=============================================================================
-- Default configuration
require('gitsigns').setup {
    current_line_blame = true,
    current_line_blame_formatter = '<abbrev_sha> | <author>, <author_time:%Y-%m-%d> - <summary>',

}
require("cmp").setup()
require('leap').add_default_mappings()

--=============================================================================
-- LSP
--=============================================================================

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "dart", "java", "go" },
    highlight = { enable = true }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require("mason").setup()
require("mason-lspconfig").setup()
require 'lspconfig'.marksman.setup {}
require 'lspconfig'.gopls.setup {}
require 'lspconfig'.jdtls.setup {}
require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.dartls.setup {
    cmd = { "dart", 'language-server', '--protocol=lsp' },
}

--=============================================================================
-- SNIPPETS & COMPLETIONS
--=============================================================================
-- Set up nvim-cmp.
local cmp = require 'cmp'
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    })
})

--=============================================================================
-- TELESCOPE
--=============================================================================

require('telescope').setup({
    defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.90,
            preview_cutoff = 120,
        },
    }
}
)
