return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

		require("dap-go").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F6>", ":DapContinue<CR>", { desc = "Debug Continue / Start debug" })
		vim.keymap.set("n", "<F10>", ":DapTerminate<CR>", { desc = "Stop Debug" })
		vim.keymap.set("n", "<F7>", ":DapStepOver<CR>", { desc = "Step over" })
		vim.keymap.set("n", "<F9>", ":DapStepInto<CR>", { desc = "Step into" })
		vim.keymap.set("n", "<F8>", ":DapStepOut<CR>", { desc = "Step out" })

		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)

		vim.keymap.set("n", "<F5>", function()
			dap.run_last()
		end, { desc = "Run last config" })

		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "Hover" })

		vim.keymap.set("n", "<Leader>dh", function()
			require("dap.ui.widgets").eval()
		end, { desc = "Eval expresion" })
	end,
}
