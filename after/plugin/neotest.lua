require("neotest").setup({
        adapters = {
          require "neotest-jest",
          require "neotest-phpunit" {
            root_files = { "composer.json", "phpunit.xml" },
            filter_dirs = { "vendor", "var", "cache" },
          },
      }
})
vim.keymap.set("n", "<leader>to", "<esc><cmd>lua require('neotest').output_panel.open()<CR>")
vim.keymap.set("n", "<leader>tc", "<esc><cmd>lua require('neotest').output_panel.close()<CR>")
vim.keymap.set("n", "<leader>te", "<esc><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
vim.keymap.set("n", "<leader>tm", "<esc><cmd>lua require('neotest').run.run()<CR>")
