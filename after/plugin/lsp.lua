local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "bashls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
    "eslint",
    "intelephense",
    "jsonls",
    "lua_ls",
    "phpactor",
    -- "psalm",
    "sqlls",
    "tsserver",
    "vimls",
    "yamlls",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    -- client.resolved_capabilities.document_formatting = true
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)

    -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    -- vim.keymap.set("n", "<leader>gd", function() require("telescope.builtin").lsp_definitions() end, opts)
    vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "<leader>gI", function() require("telescope.builtin").lsp_implementations() end, opts)
    vim.keymap.set("n", "<leader>lR", function() require("telescope.builtin").lsp_references() end, opts)
    vim.keymap.set("n", "<leader>gy", function() require("telescope.builtin").lsp_type_definitions() end, opts)
    vim.keymap.set("n", "lG", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- vim.keymap.set("n", "<leader>lG", function()
    --        vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
    --          if query then
    --            -- word under cursor if given query is empty
    --            if query == "" then query = vim.fn.expand "<cword>" end
    --            require("telescope.builtin").lsp_workspace_symbols {
    --              query = query,
    --              prompt_title = ("Find word (%s)"):format(query),
    --            }
    --        end
    --  end, opts)


    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<leader>lD", function() require("telescope.builtin").diagnostics() end, opts)
    -- vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    -- vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set({"n","v"}, "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set(
        { "n", "x" },
        "<leader>rr",
        function() require('telescope').extensions.refactoring.refactors() end
    )
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focused = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },

})
