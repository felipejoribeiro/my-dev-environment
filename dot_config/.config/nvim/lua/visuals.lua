-- Colorscheme definition
-- Author: @felipejoribeiro

---------------------------------------------------------
--- Diagnostics configuration
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
--- Colors and highlights
---------------------------------------------------------
vim.cmd[[colorscheme dracula]]

local function load_highlights(highlights)
    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

local baseHl = {
  Visual = {bg = "#6C76D7"},
  CursorLine = {bg = "none"},
}

local plugginsHl = {
  CmpItemKindCopilot = {fg = "#6CC644"},
  CopilotSuggestion = {fg = "#CC88FF"},
  TranslatorBorder = {bg = "none", fg = "#ffffff"},
  GitGutterAdd = {fg = "#00FF00"},
  GitGutterChange = {fg = "#FFFF00"},
  GitGutterDelete = {fg = "#FF4877"},
  DapBreakpoint = {fg = "#FFFFFF"},
  DapStopped = {fg = "#00FF00"},
  DashboardHeader = {fg = "#00FF00"},
  DashboardCenter = {},
  DashboardShortCut = {},
  DashboardFooter = {}
}

load_highlights(baseHl)
load_highlights(plugginsHl)
