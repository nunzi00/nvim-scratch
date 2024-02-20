require "lspconfig"
local configs = require "lspconfig.configs"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
configs.phpactor.setup {
        filetypes = { 'php', 'feature' },
        default_config = {
                enabled = true,
                cmd = {
                        "phpactor",
                        "language-server",
                },
                filetypes = { "php" },
                root_dir = {
                        "composer.json",
                        ".git",
                        "../composer.json",
                        "../.git",
                },
        },
}
vim.keymap.set("n", "<leader>u", ":call phpactor#UseAdd()<CR>")                   -- Include use statemen
vim.keymap.set("n", "<leader>mm", ":call phpactor#ContextMenu()<CR>")             -- Invoke the context menu
vim.keymap.set("n", "<leader>nn", ":call phpactor#Navigate()<CR>")                -- Invoke the navigation menu
vim.keymap.set("n", "<leader>ee", ":call phpactor#ExtractExpression()<CR>")
vim.keymap.set("v", "<leader>ee", ":call phpactor#ExtractExpression(v:true)<CR>") -- Extract
vim.keymap.set("v", "<leader>ee", ":call phpactor#ExtractExpression(v:true)<CR>")
vim.keymap.set("v", "<leader>em", ":call <C-u>PhpactorExtractMethod<CR>")
vim.keymap.set("v", "<leader>ec", ":call <C-u>PhpactorExtractConstant<CR>")
