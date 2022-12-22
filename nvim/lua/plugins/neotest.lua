local setup, neotest = pcall(require, "neotest")
if not setup then
	return
end

neotest.setup({
	adapters = {
		require("neotest-rspec")({
			dap = { justMyCode = false },
		}),
	},
})
