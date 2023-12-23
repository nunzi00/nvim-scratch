vim.g.neoformat_enabled_sh = { "shmt" }
vim.g.neoformat_enabled_zsh = { "shmt" }
vim.g.neoformat_enabled_bash = { "shmt" }
vim.g.shfmt_opt = "-ci"

vim.g.neoformat_enables_yaml = { "yamlfmt", "yamlfix" }
vim.g.neoformat_enables_jsonc = { "jq", "prettierd" }
-- Enable alignment
vim.g.neoformat_basic_format_align = 1

-- Enable tab to spaces conversion
vim.g.neoformat_basic_format_retab = 1

-- Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1
