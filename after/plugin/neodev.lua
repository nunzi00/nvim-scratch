local neodev = require('neodev')
neodev.setup({
library = {
    plugins = { "nvim-dap-ui", "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    types = true },
})
