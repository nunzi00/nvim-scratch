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

local mappings = {
    -- ["<space>"] = { "", "" },
    ["|"] = { "<cmd>vs<cr>", "Vertical Split" },
    ["a"]       = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon Add File" },
    ["b"]       = {
        name = "Buffers",
        p = { "<cmd>bp<cr>", "Previous" },
        n = { "<cmd>bn<cr>", "Next" },
        d = { "<cmd>bd<cr>", "Delete" },
        -- s = { "", "" },
    },
    -- ["d"]       = { '[["_d]]', "_d" },
    ["e"]       = { "<cmd>Neotree toggle<cr>", "Neotree toggle" },
    ["j"]       = { "<cmd>lprev<CR>zz", "lprevzz" },
    ["k"]       = { "<cmd>lnext<CR>zz", "lnextzz" },
    -- ["o"]       = { "", "" },
    ["q"]       = { "<cmd>wqall!<CR>", "Quit" }, -- Quit Neovim after saving the file
    ["Q"]       = { "<nop>", "Close modal" }, -- Quit Neovim after saving the file
    -- ["r"]       = { "[[:%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>]]", "Replace word" },
    -- ["u"]       = { "", "" },
    -- ["y"]       = { "", "" },
    -- ["Y"]       = { "", "" },
    -- ["s"]       = { "<cmd>w!<CR>", "Save" },
    -- ["c"]       = {
        -- name = "",
        -- a = { "", "" },
        -- t = { "", "" },
    -- },
    ["f"]       = {
        name = "Telescope",
        b = { "", "Telescope buffers" },
        f = { "", "Telescope find files" },
        g = { "", "Telescope live grep" },
        h = { "", "Telescope help tags" },
        r = { "<cmd>TextCaseOpenTelescope<CR>", "Telescope TextCase" },
    },
    ["g"]       = {
        name = "",
        d = { "<cmd>lua require('telescope.builtin').lsp_definitions()", "Lsp Definitions" },
        g = { "<cmd>LazyGit<CR>", "LazyGit" },
        y = { "<cmd>lua require('telescope.builtin').lsp_type_definitions()", "Lsp Type Definitions" },
        I = { "<cmd>lua require('telescope.builtin').lsp_implementations()", "Lsp Implementations" },
        R = { "<cmd>lua require('trouble').toggle('lsp_references')<cr>", "QuixkFix Lsp References" },
        -- s = { "", "" },
    },
    ["l"]       = {
        name = "",
        f = { "vim.lsp.buf.format", "Format Buffer" },
        i = { "<cmd>LspInfo<CR>", "Lsp Info" },
        D = { "<cmd>lua require('telescope.builtin').diagnostics()", "Lsp Diagonistic" },
        R = { "<cmd>lua require('telescope.builtin').lsp_references()", "Lsp References" },
        -- r = { "", "Rename Symbol" },
    },
    ["m"]       = {
        name = "",
        r = { "<cmd>CellularAutomaton make_it_rain<CR>", "Make it rain" },
    },
    ["p"]       = {
        -- name = "",
        f = { "<cmd>lua require('telescope.builtin').find_files<cr>", "Find Files" },
        -- s = { "<cmd>lua require('telescope.builtin').grep_string", "Find word" },
        -- v = { "", "" },
    },
    -- ["s"]       = {
        -- name = "",
        -- d = { "", "" },
        -- l = { "", "" },
        -- s = { "", "" },
    -- },
    ["t"]       = {
        name = "Test",
        a = { "", "Docker Unit Test" },
        c = { "<esc><cmd>lua require('neotest').output_panel.close()<CR>", "Close neotest panel" },
        e = { "<esc><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Test File" },
        m = { "<esc><cmd>lua require('neotest').run.run()<CR>", "Test Method" },
        o = { "<esc><cmd>lua require('neotest').output_panel.open()<CR>", "Open neotest panel" },
    },
    ["v"]       = {
        -- name = "",
        -- d = { "", "Lsp Diagonistic Open Float" },
        h = { "<cmd>lua require('telescope.builtin').help_tags<cr>", "Help Files" },
    },
    ["x"]       = {
        name = "Trouble",
        d = { "<cmd>lua require('trouble').toggle('document_diagnostics')<cr>", "QuixkFix Document" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "Toggle QuixkFix" },
    },
    -- ["z"]       = {
    --     name = "ZenMode",
    --     Z = { "", "" },
    --     z = { "", "" },
    -- },



}

which_key.setup(setup)
which_key.register(mappings, opts)
