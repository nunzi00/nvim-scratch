vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

    vim.keymap.set(
	{"n", "x"},
	"<leader>rr",
	function() require('telescope').extensions.refactoring.refactors() end
)
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>lr", function()
    require "inc_rename"
    return ":IncRename " .. vim.fn.expand "<cword>"
end)

vim.keymap.set("n", "<C-/>", function()
    require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
    vim.cmd "norm! j"
end)
vim.keymap.set("n", "<leader>ta", function()
    vim.cmd "!docker exec gf_back sh -c 'APP_ENV=test php vendor/bin/phpunit'"
end)
vim.keymap.set("n", "<leader>ct", function()
    local file = vim.fn.expand "%"
    local command = string.format("!docker exec gf_back sh -c 'php vendor/bin/psalm -c psalm.xml %s'", file)
    vim.notify(command)
    vim.cmd(command)
end)
vim.keymap.set("n", "<leader>psa", function()
    local file = vim.fn.expand "%"
    local command = string.format("!docker exec gf_back sh -c 'php vendor/bin/psalm -c psalm-local.xml'", file)
    -- or                            , branch = '0.1.x',
    vim.notify(command)
    vim.cmd(command)
end)
vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action { apply = true }
end)
vim.keymap.set("n", "<leader>fr", "<cmd>TextCaseOpenTelescopeQuickChange<CR>")
vim.keymap.set("n", "<leader>to", "<esc><cmd>lua require('neotest').output_panel.open()<CR>")
vim.keymap.set("n", "<leader>tc", "<esc><cmd>lua require('neotest').output_panel.close()<CR>")
vim.keymap.set("n", "<leader>te", "<esc><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
vim.keymap.set("n", "<leader>tm", "<esc><cmd>lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>ff", "<esc><cmd>Telescope find_files<cr>")
vim.keymap.set('n', '<leader>fg', "<esc><cmd>Telescope live_grep<cr>")
vim.keymap.set('n', '<leader>fb', "<esc><cmd>Telescope buffers<cr>")
vim.keymap.set('n', '<leader>fh', "<esc><cmd>Telescope help_tags<cr>")
vim.keymap.set('n', '<leader>o', function()
    if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
    else
        vim.cmd.Neotree "focus"
    end
end)
vim.keymap.set("n", "<C-q>", "<cmd>qa!<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w!<cr>")
vim.keymap.set("n", "|", "<cmd>vs<cr>")
vim.keymap.set("n", "bp", "<cmd>bp<cr>")
vim.keymap.set("n", "bn", "<cmd>bn<cr>")
vim.keymap.set("n", "be", "<cmd>be<cr>")
vim.keymap.set("n", "bd", "<cmd>Bdelete<cr>")

