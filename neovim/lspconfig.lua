local lspconfig = require("lspconfig")

-- Golang
lspconfig.gopls.setup {}

-- Lua
lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

-- Typescript
lspconfig.tsserver.setup {
	root_dir = lspconfig.util.root_pattern("package.json", ".git")
}

-- Nix
lspconfig.nixd.setup {}

-- Lsp buttons
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<F8>", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<S-F8>", vim.diagnostic.goto_prev, opts)
	end,
})

-- Rust is handled by the rust-tools plugin
