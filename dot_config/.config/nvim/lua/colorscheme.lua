-- Colorscheme definition
-- Author: @felipejoribeiro

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
}

load_highlights(baseHl)
load_highlights(plugginsHl)
