-- Mappings.
local home = os.getenv("HOME")

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>Q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>aw', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  if client.server_capabilities.colorProvider then
    require("document-color").buf_attach(bufnr)
  end
end

---------------------------------------------------------
--- Language server configuration
---------------------------------------------------------
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = true,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

---------------------------------------------------------
--- Initializing servers
---------------------------------------------------------
require("grammar-guard").init()
-- local eslint_config = require("lspconfig.server_configurations.eslint")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')
local lsp_servers = {
  'bashls', -- npm install -g bash-language-server
  'gdscript', -- install the godot editor https://github.com/habamax/vim-godot
  -- 'eslint', --npm install -g eslint~/.local~/.local/share/nvim/lsp_servers/ltex/share/nvim/lsp_servers/ltex
  -- 'tsserver', -- npm install -g typescript typescript-language-server
}

for _, lsp in ipairs(lsp_servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require('nvim-lsp-installer').on_server_ready(function(server)
  local opt = {}
  opt.on_attach = on_attach
  opt.capabilities = capabilities

  if server.name == "sumneko_lua" then
    opt.settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT'
        },
        diagnostics = {
          globals = { 'vim', 'use' }
        }
      }
    }
  end

  if server.name == "ltex" then
    opt.settings = {
      ltex = {
        enabled = { "latex", "tex", "bib", "markdown" },
        language = "en-US",
        diagnosticSeverity = "information",
        setenceCacheSize = 2000,
        checkFrequency = "edit",
        trace = { server = "verbose" },
        additionalRules = {
          enablePickyRules = true,
          motherTongue = "pt-BR",
        },
      }
    }
    opt.on_attach = function(client, bufnr)
      require("ltex_extra").setup{
        load_langs = { "pt-BR", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
        init_check = true, -- boolean : whether to load dictionaries on startup
        path = home .. '/.config/nvim/grammar', -- string : path to store dictionaries. Relative path uses current working directory
        log_level = "debug", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
      }
      on_attach(client, bufnr)
    end
  end

  if server.name == "tailwindcss" then
    opt.capabilities.textDocument.colorProvider = {
      dynamicRegistration = true
    }
  end

  server:setup(opt)
end)
