require("neotest").setup({
        adapters = {
          require "neotest-jest",
          require "neotest-phpunit" {
            root_files = { "composer.json", "phpunit.xml" },
            filter_dirs = { "vendor", "var", "cache" },
          },
      }
})
