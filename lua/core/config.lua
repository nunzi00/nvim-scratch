local options = {
    autochdir = false,
    backup = false,
    cmdheight = 2,
    colorcolumn = { "80", "120" },
    expandtab = true,
    fileencoding = "utf-8",
    guicursor = "",
    hlsearch = false,
    ignorecase = true,
    incsearch = true,
    nu = true,
    relativenumber = false,
    scrolloff = 0,
    shiftwidth = 4,
    signcolumn = "yes",
    smartindent = true,
    softtabstop = 4,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    updatetime = 50,
    wrap = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.isfname:append("@-@")


local goptions = {
    autopairs_enabled = true,
    cmp_enabled = true,
    diagnostics_mode = 3,
    icons_enabled = true,
}

for k, v in pairs(goptions) do
    vim.g[k] = v
end


vim.filetype.add {
    extension = {
        neon = "yaml",
        pipeline = "groovy",
    },
    filename = {
        ["docker-compose"] = "dockercompose",
        ["Jenkinsfile"] = "groovy",
    },
}
