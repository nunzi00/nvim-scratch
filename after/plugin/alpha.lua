local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"                                         ",
	"                                         ",
	"                                         ",
	"██╗░░░░░██╗░░░██╗░█████╗░░█████╗░░██████╗",
	"██║░░░░░██║░░░██║██╔══██╗██╔══██╗██╔════╝",
	"██║░░░░░██║░░░██║██║░░╚═╝███████║╚█████╗░",
	"██║░░░░░██║░░░██║██║░░██╗██╔══██║░╚═══██╗",
	"███████╗╚██████╔╝╚█████╔╝██║░░██║██████╔╝",
	"╚══════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░",
	"                                         ",
	"                                         ",
	"                                         ",
}
dashboard.config.opts.noautocmd = true
dashboard.config.opts.margin = 50

dashboard.section.buttons.val = {

		dashboard.button("e", "  New file", "<cmd>ene <CR>"),
		dashboard.button("SPC f f", "󰈞  Find file"),
		dashboard.button("SPC f o", "󰊄  Recently opened files"),
		-- dashboard.button("SPC f r", "  Frecency/MRU"),
		dashboard.button("SPC f g", "󰈬  Find word"),
		-- dashboard.button("SPC f m", "  Jump to bookmarks"),
		dashboard.button("SPC s l", "  Open lasts sessions"),
		dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
}

vim.cmd([[autocmd User AlphaReady echo 'ready to coding!!!']])

alpha.setup(dashboard.config)
