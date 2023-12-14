vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 0
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.cmp_enabled = true
vim.g.diagnostics_mode = 3
vim.g.icons_enabled = true
vim.g.autopairs_enabled = true

vim.opt.colorcolumn = { "120" }
vim.opt.fileencoding = "utf-8"
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
vim.opt.autochdir = false
