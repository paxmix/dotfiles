require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "marksman", "gopls", "golangci_lint_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
