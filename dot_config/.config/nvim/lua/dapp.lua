-- DAP configuration
-- Author: @felipejoribeiro

PANE = {}
local attachToReactNative = function()
	print("dap not found")
end
local startReactNative = function()
	print("dap not found")
end
local compileAndroidApp = function()
	print("dap not found")
end

local openTmuxPane = function(cmd)
	local windows = vim.fn.systemlist("tmux list-windows")
	local termExists = false
	for _, window in ipairs(windows) do
		if window:find("term") then
			termExists = true
			break
		end
	end

	if termExists then
		vim.fn.system("tmux split-window -v -t term '" .. cmd .. "'")
	else
		-- open new window named term and run command
		-- the pane will persist after command is finished
		vim.fn.system("tmux new-window -n term '" .. cmd .. "; read'")
	end
	-- list of panes
	local panes = vim.fn.systemlist("tmux list-panes -a -F '#{pane_id}'")
	PANE = panes[#panes]
end

local closeTmuxLastOpenedPane = function()
	vim.fn.system("tmux kill-pane -t " .. PANE)
	print("Pane closed")
end

if pcall(require, "dap") then
	local dap = require("dap")
	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })

	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", "<space>dh", '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>dk", '<cmd>lua require("dap").step_out()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>dl", '<cmd>lua require("dap").step_into()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>dj", '<cmd>lua require("dap").step_over()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>dc", '<cmd>lua require("dap").continue()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>D", '<cmd>lua require("dap").run_last()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>da", '<cmd>lua require("dap").attach()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>dr", '<cmd>lua require("dap").repl.open({}, "vsplit")<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>de", '<cmd>lua require("dap").set_exception_breakpoints({"all"})<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>da", '<cmd>lua require("dap").attach()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>de", '<cmd>lua require("dap").set_exception_breakpoints({"all"})<CR>', opts)

	vim.api.nvim_set_keymap("n", "<space>dt", '<cmd>lua require("dapui").float_element("Repl")<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>di", '<cmd>lua require("dapui").eval()<CR>', opts)
	vim.api.nvim_set_keymap("v", "<space>di", '<cmd>lua require("dapui").eval()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<space>dd", '<cmd>lua require("dapui").toggle()<CR>', opts)

	dap.adapters.node2 = {
		type = "executable",
		command = "node",
		args = { os.getenv("HOME") .. "/.config/nvim/local_dap/vscode-node-debug2/out/src/nodeDebug.js" },
	}

	for _, language in ipairs({ "typescript", "javascript" }) do
		require("dap").configurations[language] = {
			-- debugger used in jest tests
			{
				type = "pwa-node",
				request = "launch",
				name = "Jest Tests",
				-- trace = true, -- include debugger info
				runtimeExecutable = "node",
				runtimeArgs = {
					"./node_modules/jest/bin/jest.js",
					"--runInBand",
				},
				rootPath = "${workspaceFolder}",
				cwd = "${workspaceFolder}",
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
			},
			-- debugger used in react-native
			{
				name = "React native",
				type = "node2",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
				port = 35000,
			},
		}
	end

	attachToReactNative = function()
		vim.fn.system("adb shell input keyevent 82")
		openTmuxPane("node ~/.config/nvim/local_dap/nvim-dap-reactnative/src/standalone.js")
	end

	startReactNative = function()
		openTmuxPane([[zsh -c "/Users/fejori/.nvm/versions/node/v14.19.1/bin/yarn start"]])
		openTmuxPane([[/Users/fejori/.nvm/versions/node/v14.19.1/bin/react-native run-android]])
	end

	compileAndroidApp = function()
		openTmuxPane([[/Users/fejori/.nvm/versions/node/v14.19.1/bin/react-native run-android --verbose]])
	end

	local function set_keymaps_for_react_native()
		local isReactNativeProject = function()
			local path = vim.fn.expand("%:p")
			return string.find(path, "snackin") ~= nil
		end

		if isReactNativeProject() then
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<space>da",
				'<cmd>lua require("dapp").attachToReactNative()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<space>js",
				'<cmd>lua require("dapp").startReactNative()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<space>jc",
				'<cmd>lua require("dapp").compileAndroidApp()<CR>',
				{ noremap = true, silent = true }
			)
		end
	end
	vim.api.nvim_create_autocmd("FileType", { callback = set_keymaps_for_react_native })
end

return {
	attachToReactNative = attachToReactNative,
	startReactNative = startReactNative,
	compileAndroidApp = compileAndroidApp,
	openTmuxPane = openTmuxPane,
	closeTmuxLastOpenedPane = closeTmuxLastOpenedPane,
}
