-- check if dap package is installed

if pcall(require, "dap") then
  local dap = require('dap')
  dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/vscode-node-debug2/out/src/nodeDebug.js" },
  }

  dap.configurations.typescriptreact = {
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


--
-- local function debugJest(testName, filename)
--   print("starting " .. testName .. " in " .. filename)
--   dap.run({
--       type = 'node2',
--       request = 'launch',
--       cwd = vim.fn.getcwd(),
--       runtimeArgs = {'--inspect-brk', '/usr/local/bin/jest', '--no-coverage', '-t', testName, '--', filename},
--       sourceMaps = true,
--       protocol = 'inspector',
--       skipFiles = {'<node_internals>/**/*.js'},
--       console = 'integratedTerminal',
--       port = 9222,
--       })
-- end
--
-- local function attach()
--   print("attaching")
--   dap.run({
--       type = 'node2',
--       request = 'attach',
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       protocol = 'inspector',
--       skipFiles = {'<node_internals>/**/*.js'},
--       })
-- end
--
-- local function attachToRemote()
--   print("attaching")
--   dap.run({
--       type = 'node2',
--       request = 'attach',
--       address = "127.0.0.1",
--       port = 9222,
--       localRoot = vim.fn.getcwd(),
--       remoteRoot = "/home/vcap/app",
--       sourceMaps = true,
--       protocol = 'inspector',
--       skipFiles = {'<node_internals>/**/*.js'},
--       })
-- end
--
-- local function attachToReactNative()
--   print("attaching")
--   dap.run({
-- 	type = "node2",
-- 	request = "attach",
-- 	program = "${file}",
-- 	cwd = vim.fn.getcwd(),
-- 	sourceMaps = true,
-- 	protocol = "inspector",
-- 	console = "integratedTerminal",
-- 	port = 35000
--       })
-- end
--
-- return {
--   attachToReactNative = attachToReactNative,
--   debugJest = debugJest,
--   attach = attach,
--   attachToRemote = attachToRemote,
-- }
