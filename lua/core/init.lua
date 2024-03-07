require("core.config")
require("core.keymap")
require("core.packer")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup("ThePrimeagen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = ThePrimeagenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("BufEnter", {
	desc = "Open Neo-Tree on startup with directory",
	group = augroup("neotree_start", { clear = true }),
	callback = function()
		if package.loaded["neo-tree"] then
			vim.api.nvim_del_augroup_by_name("neotree_start")
		else
			local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0)) -- TODO: REMOVE vim.loop WHEN DROPPING SUPPORT FOR Neovim v0.9
			if stats and stats.type == "directory" then
				vim.api.nvim_del_augroup_by_name("neotree_start")
				require("neo-tree")
			end
		end
	end,
})
autocmd("TermClose", {
	pattern = "*lazygit*",
	desc = "Refresh Neo-Tree when closing lazygit",
	group = augroup("neotree_refresh", { clear = true }),
	callback = function()
		local manager_avail, manager = pcall(require, "neo-tree.sources.manager")
		if manager_avail then
			for _, source in ipairs({ "filesystem", "git_status", "document_symbols" }) do
				local module = "neo-tree.sources." .. source
				if package.loaded[module] then
					manager.refresh(require(module).name)
				end
			end
		end
	end,
})
-- autocmd("VimLeavePre", {
-- 	desc = "Save session on close",
-- 	group = augroup("resession_auto_save", { clear = true }),
-- 	callback = function()
-- 		local save = require("resession").save
-- 		save("Last Session", { notify = false })
-- 	end,
-- })
-- autoformat al guardar ficheros
-- vim.cmd([[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]])

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.cmd([[
  augroup _php_settings
    autocmd!
    autocmd FileType php :setlocal sw=4 ts=4 sts=4
  augroup end
]])

vim.cmd([[
    augroup _yaml_settings
        autocmd!
        autocmd FileType yaml :setlocal ts=2 sts=2 sw=2 expandtab
    augroup end
]])
vim.cmd([[
  augroup _behat_settings
    autocmd!
    autocmd FileType feature :setlocal sw=4 ts=4 sts=4
  augroup end
]])

vim.cmd([[
  augroup _custom_filetypes
    autocmd!
    autocmd BufNewFile,BufRead .env.* setf sh
  augroup end
]])
