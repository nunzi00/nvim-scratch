-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	--
	-- theme
	--
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use({ "catppuccin/nvim", as = "catppuccin" })
	--
	-- General
	--
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("nvim-treesitter/nvim-treesitter-context")

	use("theprimeagen/harpoon")

	use("mbbill/undotree")

	use("folke/zen-mode.nvim")

	use("eandrju/cellular-automaton.nvim")

	use("laytan/cloak.nvim")

	use({ "m4xshen/hardtime.nvim", requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" } })

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		run = ":TSUpdate",
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
	--
	-- LSP
	--
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			({ "L3MON4D3/LuaSnip" }),
			{ "rafamadriz/friendly-snippets" },

			-- Formatter
			{ "lukas-reineke/lsp-format.nvim" },
		},
	})

	use({
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup({
				Error = "#db4b4b",
				Warning = "#e0af68",
				Information = "#0db9d7",
				Hint = "#10B981",
			})
		end,
	})

	use("lukas-reineke/lsp-format.nvim")
	--
	-- Coding
	--
	use("smjonas/inc-rename.nvim")

	use("theprimeagen/refactoring.nvim")

	use("tpope/vim-fugitive")

	use("lewis6991/gitsigns.nvim")

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/neotest-jest",
			"olimorris/neotest-phpunit",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			-- "folke/neodev.nvim",
			"folke/lazydev.nvim",
		},
	})

	---     use { "phpactor/phpactor" }
	use({
		"gbprod/phpactor.nvim",
		requires = {
			"nvim-lua/plenary.nvim", -- required to update phpactor
			"neovim/nvim-lspconfig", -- required to automaticly register lsp serveur
		},
		config = function()
			require("phpactor").setup({})
		end,
	})

	use({
		"johmsalas/text-case.nvim",
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
	})

	use({
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recomended as each new version will have breaking changes
		config = function()
			require("ultimate-autopair").setup({
				--Config goes here
			})
		end,
	})
    use({"nvimtools/none-ls.nvim"})

	--
	-- Status bar
	--
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	--
	-- Session
	--
	-- use({
	-- 	"stevearc/resession.nvim",
	-- 	config = function()
	-- 		require("resession").setup()
	-- 	end,
	-- })
	--
	-- Buffers
	--
	use({ "moll/vim-bbye" })
	--
	-- Snipppets
	--
	use({ "L3MON4D3/LuaSnip" })
-- 	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = {
				"markdown",
			}
		end,
		ft = { "markdown" },
	})
     -- Debugger
  use {'mfussenegger/nvim-dap'}
  use {'theHamsta/nvim-dap-virtual-text'}
  use {"rcarriga/nvim-dap-ui"}
  -- use({ "folke/neodev.nvim" })
  use({ "folke/lazydev.nvim" })
  use({"nvim-neotest/nvim-nio"})
end)
