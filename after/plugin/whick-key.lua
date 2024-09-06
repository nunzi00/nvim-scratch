local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true,         -- shows a list of your marks on ' and `
        registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 },                                                    -- min and max height of the columns
        width = { min = 20, max = 50 },                                                    -- min and max width of the columns
        spacing = 3,                                                                       -- spacing between columns
        align = "left",                                                                    -- align columns left, center or right
    },
    ignore_missing = true,                                                                 -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "<Esc>" }, -- hide mapping boilerplate
    show_help = true,                                                                      -- show help message on the command line when the popup is visible
    triggers = "auto",                                                                     -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

-- local mappings = {
--     -- ["<space>"] = { "", "" },
--     ["|"] = { "<cmd>vs<cr>", "Vertical Split" },
--     ["a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon Add File" },
--     ["b"] = {
--         name = "Buffers & Tabs",
--         p = { "<cmd>bp<cr>", "Buffer Previous" },
--         n = { "<cmd>bn<cr>", "Buffer Next" },
--         d = { "<cmd>Bdelete<cr>", "Buffer Delete" },
--         o = { "<cmd>Bwipeout<cr><cmd>close<cr>", "Buffer Wipeout" },
--         q = { "<cmd>tabp<cr>", "TAB Previous" },
--         w = { "<cmd>tabn<cr>", "TAB Next" },
--         e = { "<cmd>tabe<cr>", "TAB New" },
--         r = { "<cmd>tabo<cr>", "TAB Close Others" },
--         a = { "<cmd>bufdo bd<cr>", "Buffer Close All" },
--     },
--     -- ["d"]       = { '[["_d]]', "_d" },
--     ["d"] = {
--         name = "Debug",
--         u = {"<cmd>lua require('dapui').toggle()<cr>", "Toggle UI"},
--     },
--     ["e"] = { "<cmd>Neotree toggle<cr>", "Neotree toggle" },
--     ["j"] = { "<cmd>lprev<CR>zz", "lprevzz" },
--     ["k"] = { "<cmd>lnext<CR>zz", "lnextzz" },
--     -- ["o"]       = { "", "" },
--     ["q"] = { "<cmd>wqall!<CR>", "Quit" }, -- Quit Neovim after saving the file
--     ["Q"] = { "<nop>", "Close modal" },    -- Quit Neovim after saving the file
--     -- ["u"]       = { "", "" },
--     -- ["y"]       = { "", "" },
--     -- ["Y"]       = { "", "" },
--     -- ["s"]       = { "<cmd>w!<CR>", "Save" },
--     -- ["c"]       = {
--     -- name = "",
--     -- a = { "", "" },
--     -- t = { "", "" },
--     -- },
--     ["f"] = {
--         name = "Telescope",
--         b = { "<cmd>Telescope buffers prompt_prefix=🔍 theme=ivy<cr>", "Telescope buffers" },
--         f = { "<cmd>Telescope find_files find_command=rg,--files prompt_prefix=🔍<cr>", "Telescope find files" },
--         g = { "<cmd>Telescope live_grep prompt_prefix=🔍<cr>", "Telescope live grep" },
--         h = { "<cmd>Telescope help_tags<cr>", "Telescope help tags" },
--         l = { "<cmd>Telescope resume<cr>", "Telescope resume last" },
--         o = { "<cmd>Telescope oldfiles prompt_prefix=🔍<cr>", "Telescope Old Files" },
--         r = { "<cmd>TextCaseOpenTelescopeQuickChange<CR>", "Telescope TextCase" },
--         w = { "<cmd>Telescope grep_string<CR>", "Telescope Grep current word" },
--     },
--     ["g"] = {
--         name = "Git",
--         g = { "<cmd>LazyGit<CR>", "LazyGit" },
--         b = { "<cmd>Telescope git_bcommits<cr>", "Git Buffer Commits" },
--         c = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
--         s = { "<cmd>Telescope git_status<cr>", "Git Status" },
--         R = { "<cmd>lua require('trouble').toggle('lsp_references')<cr>", "QuixkFix Lsp References" },
--     },
--     ["l"] = {
--         name = "LSP",
--         a = { "<cmd>vim.lsp.buf.code_action()<cr>", "Code Actions" },
--         d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Lsp Definitions" },
--         -- f = { "vim.lsp.buf.format", "Format Buffer" },
--         i = { "<cmd>LspInfo<CR>", "Lsp Info" },
--         y = { "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", "Lsp Type Definitions" },
--         D = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "Lsp Diagonistic" },
--         I = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Lsp Implementations" },
--         R = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Lsp References" },
--         -- r = { "", "Rename Symbol" },
--     },
--     ["m"] = {
--         name = "",
--         r = { "<cmd>CellularAutomaton make_it_rain<CR>", "Make it rain" },
--     },
--     ["s"] = {
--         name = "Sessions",
--         d = { "<cmd>lua require('resession').delete()<cr>", "Delete" },
--         l = { "<cmd>lua require('resession').load()<cr>", "Load" },
--         s = { "<cmd>lua require('resession').save()<cr>", "Save" },
--     },
--     ["t"] = {
--         name = "Test",
--         -- a = { "", "Docker Unit Test" },
--         c = { "<esc><cmd>lua require('neotest').output_panel.close()<CR>", "Close neotest panel" },
--         e = { "<esc><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Test File" },
--         m = { "<esc><cmd>lua require('neotest').run.run()<CR>", "Test Method" },
--         o = { "<esc><cmd>lua require('neotest').output_panel.open()<CR>", "Open neotest panel" },
--     },
--     ["v"] = {
--         -- name = "",
--         -- d = { "", "Lsp Diagonistic Open Float" },
--         h = { "<cmd>lua require('telescope.builtin').help_tags<cr>", "Help Files" },
--     },
--     -- ["x"] = {
--     --     name = "Trouble",
--     --     d = { "<cmd>lua require('trouble').toggle('document_diagnostics')<cr>", "QuixkFix Document" },
--     --     q = { "<cmd>TroubleToggle quickfix<cr>", "Toggle QuixkFix" },
--     -- },
--     ["P"] = { "<cmd><Cmd>Telescope registers<CR>", "Telescope registers" },
--
-- }

local mappings={
    { "<leader>P", "<cmd><Cmd>Telescope registers<CR>", desc = "Telescope registers", nowait = true, remap = false },
    { "<leader>Q", "<nop>", desc = "Close modal", nowait = true, remap = false },
    { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon Add File", nowait = true, remap = false },
    { "<leader>b", group = "Buffers & Tabs", nowait = true, remap = false },
    { "<leader>ba", "<cmd>bufdo bd<cr>", desc = "Buffer Close All", nowait = true, remap = false },
    { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Buffer Delete", nowait = true, remap = false },
    { "<leader>be", "<cmd>tabe<cr>", desc = "TAB New", nowait = true, remap = false },
    { "<leader>bn", "<cmd>bn<cr>", desc = "Buffer Next", nowait = true, remap = false },
    { "<leader>bo", "<cmd>Bwipeout<cr><cmd>close<cr>", desc = "Buffer Wipeout", nowait = true, remap = false },
    { "<leader>bp", "<cmd>bp<cr>", desc = "Buffer Previous", nowait = true, remap = false },
    { "<leader>bq", "<cmd>tabp<cr>", desc = "TAB Previous", nowait = true, remap = false },
    { "<leader>br", "<cmd>tabo<cr>", desc = "TAB Close Others", nowait = true, remap = false },
    { "<leader>bw", "<cmd>tabn<cr>", desc = "TAB Next", nowait = true, remap = false },
    { "<leader>d", group = "Debug", nowait = true, remap = false },
    { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle UI", nowait = true, remap = false },
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree toggle", nowait = true, remap = false },
    { "<leader>f", group = "Telescope", nowait = true, remap = false },
    { "<leader>fb", "<cmd>Telescope buffers prompt_prefix=🔍 theme=ivy<cr>", desc = "Telescope buffers", nowait = true, remap = false },
    { "<leader>ff", "<cmd>Telescope find_files find_command=rg,--files prompt_prefix=🔍<cr>", desc = "Telescope find files", nowait = true, remap = false },
    { "<leader>fg", "<cmd>Telescope live_grep prompt_prefix=🔍<cr>", desc = "Telescope live grep", nowait = true, remap = false },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags", nowait = true, remap = false },
    { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Telescope resume last", nowait = true, remap = false },
    { "<leader>fo", "<cmd>Telescope oldfiles prompt_prefix=🔍<cr>", desc = "Telescope Old Files", nowait = true, remap = false },
    { "<leader>fr", "<cmd>TextCaseOpenTelescopeQuickChange<CR>", desc = "Telescope TextCase", nowait = true, remap = false },
    { "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Telescope Grep current word", nowait = true, remap = false },
    { "<leader>g", group = "Git", nowait = true, remap = false },
    { "<leader>gR", "<cmd>lua require('trouble').toggle('lsp_references')<cr>", desc = "QuixkFix Lsp References", nowait = true, remap = false },
    { "<leader>gb", "<cmd>Telescope git_bcommits<cr>", desc = "Git Buffer Commits", nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits", nowait = true, remap = false },
    { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit", nowait = true, remap = false },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status", nowait = true, remap = false },
    { "<leader>j", "<cmd>lprev<CR>zz", desc = "lprevzz", nowait = true, remap = false },
    { "<leader>k", "<cmd>lnext<CR>zz", desc = "lnextzz", nowait = true, remap = false },
    { "<leader>l", group = "LSP", nowait = true, remap = false },
    { "<leader>lD", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", desc = "Lsp Diagonistic", nowait = true, remap = false },
    { "<leader>lI", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", desc = "Lsp Implementations", nowait = true, remap = false },
    { "<leader>lR", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "Lsp References", nowait = true, remap = false },
    { "<leader>la", "<cmd>vim.lsp.buf.code_action()<cr>", desc = "Code Actions", nowait = true, remap = false },
    { "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", desc = "Lsp Definitions", nowait = true, remap = false },
    { "<leader>li", "<cmd>LspInfo<CR>", desc = "Lsp Info", nowait = true, remap = false },
    { "<leader>ly", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", desc = "Lsp Type Definitions", nowait = true, remap = false },
    { "<leader>m", group = "", nowait = true, remap = false },
    { "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain", nowait = true, remap = false },
    { "<leader>q", "<cmd>wqall!<CR>", desc = "Quit", nowait = true, remap = false },
    { "<leader>s", group = "Sessions", nowait = true, remap = false },
    { "<leader>sd", "<cmd>lua require('resession').delete()<cr>", desc = "Delete", nowait = true, remap = false },
    { "<leader>sl", "<cmd>lua require('resession').load()<cr>", desc = "Load", nowait = true, remap = false },
    { "<leader>ss", "<cmd>lua require('resession').save()<cr>", desc = "Save", nowait = true, remap = false },
    { "<leader>t", group = "Test", nowait = true, remap = false },
    { "<leader>tc", "<esc><cmd>lua require('neotest').output_panel.close()<CR>", desc = "Close neotest panel", nowait = true, remap = false },
    { "<leader>te", "<esc><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Test File", nowait = true, remap = false },
    { "<leader>tm", "<esc><cmd>lua require('neotest').run.run()<CR>", desc = "Test Method", nowait = true, remap = false },
    { "<leader>to", "<esc><cmd>lua require('neotest').output_panel.open()<CR>", desc = "Open neotest panel", nowait = true, remap = false },
    { "<leader>vh", "<cmd>lua require('telescope.builtin').help_tags<cr>", desc = "Help Files", nowait = true, remap = false },
    { "<leader>|", "<cmd>vs<cr>", desc = "Vertical Split", nowait = true, remap = false },
  }


which_key.setup(setup)
which_key.register(mappings, opts)
vim.o.timeout = true
vim.o.timeoutlen = 300
