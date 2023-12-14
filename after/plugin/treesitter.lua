require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "php",
        "sql",
        "tsx",
        "twig",
        "typescript",
        "vim",
        "yaml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    ignore_install = { "phpdoc" },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
        filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "xml",
            "php",
        },
    },
    highlight = {
        enable = true,   -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
    },

}
