local neotest = require("neotest")
neotest.setup({
	adapters = {
		require("neotest-go")
	},
	output = {
		open_on_run = true,
	},
})
vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end)
vim.keymap.set("n", "<leader>tT", function() neotest.run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end)
vim.keymap.set("n", "<leader>ts", function() neotest.summary.open() end)
