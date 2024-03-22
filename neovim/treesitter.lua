-- Treesitter Plugin Setup
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
		disable = { "starlark" },
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}

-- Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false
