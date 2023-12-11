-- local lspconfig = require "lspconfig"
-- local configs = require "lspconfig.configs"
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = false
-- configs.intelephense.setup {
--   default_config = {
--     enabled = false,
--     cmd = { "intelephense", "--stdio" },
--     filetypes = { "php" },
--     root_dir = function(fname) return vim.loop.cwd() end,
--     settings = {
--       intelephense = {
--         files = {
--           maxSize = 500,
--           exclude = {
--             "**/.git/**",
--             "**/.svn/**",
--             "**/.hg/**",
--             "**/CVS/**",
--             "**/.DS_Store/**",
--             "**/node_modules/**",
--             "**/bower_components/**",
--             "**/vendor/**/{Tests,tests}/**",
--             "**/.history/**",
--             "**/vendor/**/vendor/**",
--             "apps/*/src/Migrations/*",
--             "apps/*/bin/*",
--             "apps/*/config/*",
--             "apps/*/public/*",
--             "apps/*/resources/*",
--             "apps/*/templates/*",
--             "app/*/var/cache/docker/*",
--             "app/*/var/cache/dev/*",
--             "app/*/var/cache/test/*",
--             "app/*/var/cache/stg/*",
--             "app/*/var/cache/prd/*",
--             "app/*/var/cache/local/*",
--             "/home/lucas/getlife/backend/vendor/fakerphp/faker/src/Faker/Provider/nl_BE/Text.php",
--           },
--         },
--         environment = {
--           excludePaths = {
--             "/home/lucas/getlife/backend/vendor/**",
--             "/home/lucas/getlife/backend/var/**",
--             "/home/lucas/getlife/backend/translations/**",
--             "/home/lucas/getlife/backend/apps/Admin/var/**",
--             "/home/lucas/getlife/backend/apps/Broker/var/**",
--             "/home/lucas/getlife/backend/apps/Customer/var/**",
--           },
--           phpVersion = "8.1",
--         },
--         stubs = {
--           "apache",
--           "bcmath",
--           "bz2",
--           "calendar",
--           "com_dotnet",
--           "Core",
--           "ctype",
--           "curl",
--           "date",
--           "dba",
--           "dom",
--           "enchant",
--           "exif",
--           "FFI",
--           "fileinfo",
--           "filter",
--           "fpm",
--           "ftp",
--           "gd",
--           "gettext",
--           "gmp",
--           "hash",
--           "iconv",
--           "imap",
--           "intl",
--           "json",
--           "ldap",
--           "libxml",
--           "mbstring",
--           "meta",
--           "mysqli",
--           "oci8",
--           "odbc",
--           "openssl",
--           "pcntl",
--           "pcre",
--           "PDO",
--           "pdo_ibm",
--           "pdo_mysql",
--           "pdo_pgsql",
--           "pdo_sqlite",
--           "pgsql",
--           "Phar",
--           "posix",
--           "pspell",
--           "readline",
--           "Reflection",
--           "session",
--           "shmop",
--           "SimpleXML",
--           "snmp",
--           "soap",
--           "sockets",
--           "sodium",
--           "SPL",
--           "sqlite3",
--           "standard",
--           "superglobals",
--           "sysvmsg",
--           "sysvsem",
--           "sysvshm",
--           "tidy",
--           "tokenizer",
--           "xml",
--           "xmlreader",
--           "xmlrpc",
--           "xmlwriter",
--           "xsl",
--           "Zend OPcache",
--           "zip",
--           "zlib",
--           "phpunit",
--           "redis",
--         },
--         diagnostics = {
--           enable = true,
--         },
--         completion = {},
--       },
--       phpactor = {
--         enabled = true,
--       },
--     },
--   },
-- }
-- lspconfig.intelephense.setup { capabilities = capabilities }
--
