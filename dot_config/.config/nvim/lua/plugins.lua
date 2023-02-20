-- pluggins configuration
-- Author: @felipejoribeiro

local glo = vim.g
local fn = vim.fn
local home = os.getenv("HOME")
local os, _ = require("utils").get_os_name()

----------------------------------------------------
-- plugins configuration
----------------------------------------------------
local dashboardSetup = function()
	local setup, db = pcall(require, "dashboard")
	if not setup then
		return
	end

	db.session_directory = fn.stdpath("data") .. "/session"
	db.preview_command = "cat | lolcat -F 0.3"
	db.preview_file_path = home .. "/.config/nvim/octopus.txt"
	db.preview_file_height = 25
	db.preview_file_width = 60
	db.custom_center = {
		{
			icon = "  ",
			desc = "Find  File                              ",
			action = "Telescope find_files find_command=rg,--hidden,--files",
			shortcut = "SPC f f",
		},
		{
			icon = "  ",
			desc = "Find  word                              ",
			action = "Telescope live_grep",
			shortcut = "SPC f g",
		},
		{
			icon = "  ",
			desc = "Find  branch                            ",
			action = "Telescope git_branches",
			shortcut = "SPC f b",
		},
	}
	db.custom_footer = { " マインドキラー " }

	-- db.custom_header = {
	--   [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⢀⠀⠈⠻⢿⣿⣿⢿⣿⣿⢿⣿⢻⣆⠀⢻⣿⣿⣯⣼⣿⣯⣿⣷⡀⠘⡿⢿⣿⣿⣧⠀⠹⣿⣿⣿⣿⣿⡿⠟⠋⠀⣠⣿⣿⣿⣿⣿]],
	--   [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠑⢦⣀⠀⠉⠻⢾⣿⣿⣿⣿⣿⣿⡀⠀⢻⣟⣿⣿⣻⣿⣿⣿⣧⠀⠹⣿⣿⣿⡟⠀⣸⣿⣿⣿⡿⠋⠀⣠⣴⣿⠿⢿⢿⣿⣿⣿]],
	--   [[⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣧⣄⠈⠙⢷⣤⡀⠀⠙⢷⣿⣿⣿⣶⠧⡀⠈⢻⣿⣿⣿⣿⣿⣿⣿⠆⠀⢿⣿⠟⠀⣰⣿⣿⣿⡟⠁⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	--   [[⣿⣿⣷⣿⡿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣶⡀⠀⠹⣿⣦⠀⠈⣿⣯⣽⣿⡟⣇⠀⠀⣿⣿⣿⣿⣿⡿⠟⠀⣠⠟⠁⢀⣼⣿⡿⠟⠁⢀⣴⣿⣿⣿⣿⣟⣿⣿⣿⣿⣯⠿]],
	--   [[⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠛⠛⠋⠀⠀⣿⡋⠀⢰⡿⣿⣿⣿⣿⣿⠀⠀⣿⣿⣿⡿⠋⠀⢀⠔⠁⣀⣴⣿⣿⠋⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⢀⣠]],
	--   [[⠀⣠⣤⣤⣤⣤⣤⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠉⠀⠀⣿⣿⣿⢿⢻⣿⡟⠀⠀⣯⣽⡽⠁⠀⢠⠁⣀⣬⣿⣯⡟⠁⠀⣴⣿⣿⣿⣽⣿⣾⣿⣿⡿⠟⠁⢀⣴⣿⣿]],
	--   [[⣾⣿⣿⣿⣿⣷⣿⡻⢿⣿⣿⠿⠛⠉⢀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣾⡿⠿⠃⠀⠀⡿⣿⠁⠀⠀⡎⣸⣿⣿⠿⠃⠀⣠⣾⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⣠⣾⣿⣿⣿⣿]],
	--   [[⣿⣿⣿⣿⣿⡿⣿⣷⡿⠛⢁⣠⣶⣿⣯⣿⣿⣶⣷⣄⠀⠀⠀⠙⠓⠙⠉⠀⠀⠀⠑⠚⠀⠀⠀⠀⠉⠋⠁⠀⢀⣴⣿⣿⣿⣿⣿⠟⠋⠀⢀⣀⣴⣾⣿⣿⣿⡟⠿⠿]],
	--   [[⣿⣿⣿⣿⡿⣿⣿⠟⢁⣴⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣷⡆⠀⠀⠀⢀⣠⣤⣶⣶⣶⣶⣤⣄⡀⠀⠀⠀⠠⣈⣿⣿⣿⣛⣿⠟⠁⠀⣠⠾⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀]],
	--   [[⠀⠀⠉⠉⠙⠉⠋⠀⠺⣿⣿⣛⣿⣿⣿⣿⣟⣿⣿⣿⣽⣿⡷⣶⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⢴⣿⣿⠟⠛⠉⠀⠀⣠⡾⢿⠿⠋⠁⠀⠀⠀⠀⢀⣀⣀⡀]],
	--   [[⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣏⣿⣿⡟⣿⣿⣿⣿⡟⠉⣛⢿⣿⣿⣿⡿⠿⣿⣿⡇⠁⠒⠀⠠⠄⠒⢀⣡⠾⠿⠋⠀⠀⠀⢀⣠⣤⣾⣿⣿⣿⣿⣿]],
	--   [[⣿⣿⣾⣿⣶⣶⣤⡀⠀⠀⠀⠀⠈⠚⢿⡷⡿⡿⠿⠤⠏⠋⠁⠀⢻⣧⣀⣈⣾⣿⣿⣿⠀⠂⢨⣿⠇⠀⠀⠀⠀⠒⠈⠉⠈⠀⠀⠀⠀⠀⠖⠛⠛⠉⠉⣉⡉⠉⠉⢉]],
	--   [[⣿⣿⣿⣿⣿⣿⣧⣍⣇⣄⠀⠀⠀⠀⠀⣀⣀⣀⣠⣴⠖⠒⠀⠀⠀⠉⡛⠿⠿⣿⣿⣿⡷⠶⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣻⣿⣿⣿⣿⣿⣿]],
	--   [[⠿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠸⠿⡿⠿⠟⠋⠀⠀⠀⠀⠴⠚⠁⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿]],
	--   [[⣤⣄⣀⡈⠉⠉⠉⠉⠉⠁⠛⠛⠛⠛⠲⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠄⠀⢀⠀⠳⠀⠀⠀⠀⠀⢀⣀⠀⣀⡠⢤⣾⣾⣿⣿⡿⠿⠓⠛⠿⢿⣽⣿⣿⣽⣿]],
	--   [[⣿⣻⣿⣿⣿⣯⣿⣿⣿⠷⣶⣤⣄⣀⠀⠀⠀⠀⠀⢀⣤⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠓⠚⠛⠉⠉⠁⠀⢀⣀⢀⣀⡀⠀⠉⠉⠉⠉]],
	--   [[⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡶⠟⠁⠀⠀⠀⢀⣴⣿⡶⠟⠁⠀⠀⣰⣶⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⡤⣤⣶⣾⣏⣿⣿⣿⣿⣾⣷⣶⣦⣤]],
	--   [[⠀⠘⠿⢿⣿⣿⢿⡽⠟⠊⠉⠀⠀⠀⠀⣀⣼⣿⣿⣽⣿⠦⠀⠀⣴⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣷⣿⣿]],
	--   [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣿⣟⠂⠀⢸⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣒⣄⠀⠀⠙⢾⡦⠀⠀⠀⠀⠀⠉⠙⠛⠛⠛⠿⠿⠿⢿⣿⣿⣿⣿]],
	--   [[⣶⣤⣀⣀⣀⣀⣀⣀⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⡿⠂⠀⢠⡿⠁⠀⠀⠀⠀⢠⣶⣦⡀⠀⠀⠙⣿⣧⠀⠀⠈⠿⣾⣷⣤⣀⡀⠀⠀⠀⠈⠉⠉⠛⠚⠲⠶⢭⡛⢿]],
	--   [[⠻⢿⣿⣿⣻⣿⣿⡿⣿⣿⣿⣿⣿⣿⣻⣿⢿⡿⠟⠁⠀⠀⠜⠁⢀⣦⠀⠀⠀⠸⣯⣿⣆⠀⠀⠀⠸⣿⣷⣤⡀⠀⠀⠀⠀⠈⠙⠿⣿⣿⣶⣶⣶⣶⣤⣄⡀⠀⠈⠓]],
	--   [[⠀⠀⠀⠉⠉⠙⠛⠛⠛⠛⠛⠛⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⢰⣿⣻⡄⠀⠀⠀⣿⣿⣿⣇⠀⠀⠀⠹⣿⣿⣿⣦⡀⠑⠶⣶⣄⣀⣀⣀⠉⠙⠛⠿⢿⣿⣿⣶⣄⡀]],
	--   [[⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣠⣿⣿⣛⣧⡀⠀⠀⠸⣏⣿⣿⣷⡀⠀⠀⠹⣿⣿⣿⣾⣶⣤⣀⠉⠉⠙⠛⠿⢷⣦⣤⣄⣀⣀⠉⠉⠉]],
	--   [[⣿⠀⢸⣿⣿⣿⣶⣶⣶⣶⢶⣶⠶⠶⠆⠀⣠⣄⠀⠻⣿⣿⣿⣿⣿⣿⣿⣓⡄⠀⠀⠹⣿⣿⣿⣷⡀⠀⠀⠹⣿⣿⣿⠿⣿⣿⣷⣶⠦⣄⡀⠀⠙⢿⣯⡽⠟⠋⠀⢀]],
	--   [[⣿⡀⠸⣿⣿⣿⣿⡿⢿⡿⠋⠀⣀⣤⠴⣾⣿⣿⣷⣄⠉⠻⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠹⣿⣹⣯⣹⠀⠀⠀⠈⠻⣿⣿⣿⣭⣿⣿⣿⡷⣽⣦⣀⠀⠀⠀⠀⠀⢀⣻]],
	--   [[⠻⣷⡀⠹⣿⣿⡿⣿⣿⠁⢠⣾⣷⣻⣿⣿⣿⣿⣿⣿⣷⡄⠈⢿⣿⣷⣾⣧⣿⣷⠀⠀⢀⣿⣿⣿⣿⣟⣰⣄⠀⠀⠈⠻⣿⢿⣿⣹⣿⣷⠿⠛⠁⠀⣀⣵⣴⣾⣿⣿]],
	--   [[⣀⡘⠧⠀⢼⣿⣟⣿⡇⠀⣞⣿⣿⣿⣿⣻⣿⣿⣷⣿⣿⣿⡄⠀⢻⣟⣿⣿⣿⠟⠀⠀⠀⠛⢿⣿⣿⣿⣿⣿⣳⣄⡀⠀⠀⠉⠉⠉⠉⣀⡠⠤⣒⣋⡁⠈⠛⢿⣿⣿]],
	--   [[⣿⣽⣷⣄⠈⢿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡇⠀⣸⣿⣿⠟⠁⢀⣴⣾⣁⡄⠀⢿⣾⣿⣿⣿⣯⣿⣿⣆⡄⠀⢀⣤⣤⣶⣾⣿⢻⣿⣿⣦⣄⣀⢀⠀]],
	--   [[⣿⣿⣿⣿⣶⣄⡙⠻⣧⠈⢿⣿⣿⣿⣷⣾⣛⣿⣿⣿⣯⣿⠀⢀⣿⡛⠃⢀⣾⣏⣿⣿⣿⣷⡀⢼⣾⣿⢟⣿⡿⢿⣿⣿⣿⠀⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⢀]],
	--   [[⣻⣿⣿⣿⣿⣿⣿⣦⣌⠓⠀⠙⢿⣿⢿⣿⣿⡿⣿⣿⡿⠃⢀⣾⡿⠃⢠⡿⣿⣿⢿⣿⢻⣿⠀⣿⣻⣿⣿⣿⣿⣿⢿⢿⣿⠀⣿⢻⣿⡿⠛⠛⠋⠉⠉⠀⢀⣀⣤⣾]],
	-- }
end

local asyncRunSetup = function()
	glo.asyncrun_open = 6
end

local asyncRunTaskSetup = function()
	glo.asynctasks_term_pos = "tmux"
	glo.asynctasks_term_pos = "TAB"
end

local nvimTreesitterSetup = function()
	local status, treessiterConf = pcall(require, "nvim-treesitter.configs")
	if not status then
		return
	end

	treessiterConf.setup({
		ensure_installed = { "lua", "python", "javascript" },
		highlight = {
			enable = true,
			disable = { "" },
		},
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})
end

local draculaSetup = function()
	local status, dracula = pcall(require, "dracula")
	if not status then
		return
	end
	dracula.setup({
		transparent_bg = true,
		italic_comment = true,
		overrides = {
			Normal = { fg = dracula.colors().white, bg = "None" },
		},
	})
end

local indentBlankLineSetup = function()
	glo.indent_blankline_char = "▏"
	glo.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "NvimTree" }
	glo.indent_blankline_buftype_exclude = { "terminal", "dashboard" }
	glo.indent_blankline_max_indent_increase = 2
	glo.indent_blankline_use_treesitter = true
	glo.indent_blankline_show_trailing_blankline_indent = false
	glo.indent_blankline_show_end_of_line = false
	glo.indent_blankline_show_first_indent_level = true
	require("indent_blankline").setup({
		space_char_blankline = " ",
		show_current_context = true,
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
	})
end

local luaLineSetup = function()
	require("lualine").setup({
		options = {
			theme = "dracula",
			always_divide_middle = true,
			ignore_filetypes = { "dashboard", "NvimTree", "help" },
			ignore_focus = { "dashboard", "NvimTree", "help" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{
					"branch",
					fmt = function(branch)
						-- get size of the current buffer
						local size = vim.fn.line("$")
						if size < 50 then
							if #branch > 15 then
								return string.sub(branch, 1, 15) .. "..."
							end
						end
						return branch
					end,
				},
				"diff",
				"diagnostics",
			},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
end

local todoCommentsSetup = function()
	require("todo-comments").setup({
		keywords = {
			BUG = { icon = " ", color = "error", alt = { "FIXME", "BUG", "ISSUE" } },
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "#f06caa" },
			WARN = { icon = " ", color = "#ffb86c", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "#9192ff", alt = { "INFO" } },
		},
	})
end

local nvimColorizerSetup = function()
	require("colorizer").setup()
end

local nvimWebDevIconsSetup = function()
	require("nvim-web-devicons").setup()
	require("nvim-web-devicons").setup({
		override = {
			zsh = {
				icon = "",
				color = "#428850",
				cterm_color = "65",
				name = "Zsh",
			},
		},
		color_icons = true,
		default = true,
	})
end

local dressingSetup = function()
	require("dressing").setup({
		input = {
			enabled = true,
			border = "rounded",
			winblend = 10,
		},
	})
end

local nvimSurroundSetup = function()
	require("nvim-surround").setup()
end

local autoPairsSetup = function()
	glo.AutoPairsFlyMode = 1
	glo.AutoPairsShortcutBackInsert = "<M-b>"
	glo.AutoPairsShortcutToggle = "<M-P>"
	glo.AutoPairsMultilineClose = 1
end

local commentNvimSetup = function()
	require("Comment").setup()
end

local vimTranslatorSetup = function()
	glo.translator_target_lang = "english"
end

local grammarGuardSetup = function()
	local setup, grammar = pcall(require, "grammar-guard")
	if not setup then
		return
	end
	grammar.init()
end

local nvimTreeSetup = function()
	local setup, tree = pcall(require, "nvim-tree")
	if not setup then
		return
	end
	glo.loaded = 1
	glo.loaded_netrwPlugin = 1
	tree.setup({
		auto_reload_on_write = true,
		view = {
			mappings = {
				custom_only = false,
				list = {
					{ key = "t", action = "tabnew" },
					{ key = "l", action = "edit" },
					{ key = "h", action = "close_node" },
				},
			},
		},
		diagnostics = { enable = false },
		actions = { use_system_clipboard = true },
		filters = {
			dotfiles = true,
			custom = {},
			exclude = {},
		},
	})
end

local telescopeSetup = function()
	local setup, telescope = pcall(require, "telescope")
	if not setup then
		return
	end
	telescope.setup({
		defaults = {
			prompt_prefix = "- 🐙 :",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "descending",
			scroll_strategy = "cycle",
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			use_less = true,
			layout_strategy = "horizontal",
			layout_config = {
				width = 0.95,
				prompt_position = "bottom",
				preview_cutoff = 10,
			},
		},
		mappings = {
			i = {
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-q>"] = require("telescope.actions").send_to_qflist,
				["<space>x"] = require("telescope.actions").close,
			},
			n = {
				["<C-q>"] = require("telescope.actions").send_to_qflist,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})
	pcall(telescope.load_extension, "fzf")
end

local gitSignsSetup = function()
	local setup, signs = pcall(require, "gitsigns")
	if not setup then
		return
	end
	signs.setup()
end

local vimCopilotSetup = function()
	glo.copilot_node_command = "~/.nvm/versions/node/v16.15.0/bin/node"
	glo.copilot_no_tab_map = true
	glo.copilot_assume_mapped = true
	glo.copilot_tab_fallback = ""
	glo.copilot_filetypes = {
		["dap-repl"] = false,
		["dapui_watches"] = false,
	}
end

local vimTmuxNavigationSetup = function()
	glo.tmux_navigator_no_mappings = 1
end

local hopSetup = function()
	require("hop").setup()
end

local neoscrollSetup = function()
	require("neoscroll").setup()
end

local vimMoveSetup = function()
	glo.move_key_modifier = "A"
	glo.move_key_modifier_visualmode = "A"
end

local minimapSetup = function()
	glo.minimap_highlight_range = true
end

local vimGSetup = function()
	if os ~= "Mac" then
		glo.vim_g_open_command = "xdg-open"
	end
	glo.vim_g_python_command = "python3"
	glo.vim_g_query_url = "https://duckduckgo.com/?q="
end

local vimGodotSetup = function()
	glo.godot_executable = "/Applications/Godot.app/Contents/MacOS/Godot"
end

local nvimTsAutotagSetup = function()
	local setup, _ = pcall(require, "nvim-ts-autotag")
	if not setup then
		return
	end
	require("nvim-ts-autotag").setup()
end

local neotestSetup = function()
	require("neotest").setup({
		adapters = {
			require("neotest-jest")({
				jestCommand = "npm test --",
				jestConfigFile = "custom.jest.config.ts",
				env = { CI = true },
				cwd = function()
					return vim.fn.getcwd()
				end,
			}),
		},
		icons = {
			child_indent = "│",
			child_prefix = "├",
			collapsed = "─",
			expanded = "╮",
			failed = "ﮗ",
			final_child_indent = " ",
			final_child_prefix = "╰",
			non_collapsible = "─",
			passed = "",
			running = "ﯦ",
			running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
			skipped = "ﮮ",
			unknown = "?",
		},
	})
end

local nvimDapVscodeJsSetup = function()
	require("dap-vscode-js").setup({
		adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost" },
	})
end

local nvimDapUiSetup = function()
	require("dapui").setup({
		icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
		mappings = {
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		expand_lines = true,
	})
end

local lspSagaConfig = function()
	local setup, saga = pcall(require, "lspsaga")
	if not setup then
		return
	end

	saga.init_lsp_saga({
		move_in_saga = {
			next = "<Tab>",
			prev = "<S-Tab>",
		},
		finder_action_keys = {
			edit = "<space>o",
			vsplit = "<space>sv",
			split = "<space>sh",
			quit = "<space>x",
		},
		definition_action_keys = {
			edit = "<space>o",
			vsplit = "<space>sv",
			split = "<space>sh",
			quit = "<space>x",
		},
		code_action_icon = "  ",
		code_action_lightbulb = { enable = false },
	})
end

----------------------------------------------------
-- plugins installation
----------------------------------------------------
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local status, packer = pcall(require, "packer")
if not status then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

----------------------------------------------------
-- plugins installation
----------------------------------------------------
packer.startup(function(use)
	if Packer_bootstrap then
		packer.sync()
	end

	-- INTERNALS
	use({ "wbthomason/packer.nvim" })
	use({ "skywind3000/asyncrun.vim", config = asyncRunSetup() })
	use({
		"skywind3000/asynctasks.vim",
		config = asyncRunTaskSetup(),
		requires = { "skywind3000/asyncrun.vim", "preservim/vimux" },
	})
	use({ "zhimsel/vim-stay" })

	-- COSMETICS
	use({ "glepnir/dashboard-nvim", config = dashboardSetup() })
	use({ "nvim-treesitter/nvim-treesitter", config = nvimTreesitterSetup(), run = ":TSUpdate" })
	use({ "Mofiqul/dracula.nvim", config = draculaSetup() })
	use({ "lukas-reineke/indent-blankline.nvim", config = indentBlankLineSetup() })
	use({
		"nvim-lualine/lualine.nvim",
		config = luaLineSetup(),
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "folke/todo-comments.nvim", config = todoCommentsSetup(), requires = "nvim-lua/plenary.nvim" })
	use({ "norcalli/nvim-colorizer.lua", config = nvimColorizerSetup() })
	use({ "nvim-tree/nvim-web-devicons", config = nvimWebDevIconsSetup() })
	use({ "stevearc/dressing.nvim", config = dressingSetup() })

	-- EDITING TOOLS
	use({ "kylechui/nvim-surround", config = nvimSurroundSetup(), tag = "*" })
	use({ "jiangmiao/auto-pairs", config = autoPairsSetup() })
	use({ "tpope/vim-repeat" })
	use({ "KabbAmine/vCoolor.vim" })
	use({ "numToStr/Comment.nvim", config = commentNvimSetup() })
	use({ "voldikss/vim-translator", config = vimTranslatorSetup() })
	use({ "mbbill/undotree" })
	use({ "brymer-meneses/grammar-guard.nvim", config = grammarGuardSetup(), requires = { "neovim/nvim-lspconfig" } })

	-- FILE MANAGEMENT
	use({ "nvim-tree/nvim-tree.lua", config = nvimTreeSetup(), requires = { "kyazdani42/nvim-web-devicons" } })
	use({
		"nvim-telescope/telescope.nvim",
		config = telescopeSetup(),
		requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- NAVIGATION
	use({ "christoomey/vim-tmux-navigator", config = vimTmuxNavigationSetup() })
	use({ "phaazon/hop.nvim", config = hopSetup() })
	use({ "karb94/neoscroll.nvim", config = neoscrollSetup() })
	use({ "matze/vim-move", config = vimMoveSetup() })
	use({ "wfxr/minimap.vim", config = minimapSetup() })
	use({ "szw/vim-g", config = vimGSetup() })
	use({ "szw/vim-maximizer" })

	-- GIT
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim", config = gitSignsSetup() })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- COPILOT
	use({ "github/copilot.vim", config = vimCopilotSetup() })

	-- SNIPPETS
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "blitmap/lua-snippets" })

	-- LANGUAGE SPECIFIC
	use({ "habamax/vim-godot", config = vimGodotSetup() })
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({ "styled-components/vim-styled-components" })
	use({ "windwp/nvim-ts-autotag", config = nvimTsAutotagSetup() })

	-- COMPLETION
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "f3fora/cmp-spell" })
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
	use({ "saadparwaiz1/cmp_luasnip" })

	-- LINT
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "jayp0521/mason-null-ls.nvim" })

	-- DEBUGGING
	use({ "mfussenegger/nvim-dap" })
	use({
		"nvim-neotest/neotest",
		config = neotestSetup(),
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
	})
	use({ "mxsdev/nvim-dap-vscode-js", config = nvimDapVscodeJsSetup(), requires = { "mfussenegger/nvim-dap" } })
	use({ "microsoft/vscode-js-debug", opt = true, run = "npm install --legacy-peer-deps && npm run compile" })
	use({ "rcarriga/nvim-dap-ui", config = nvimDapUiSetup(), requires = { "mfussenegger/nvim-dap" } })

	-- LSP (CONFIG IN DADICATED FILE LSP)
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "glepnir/lspsaga.nvim", config = lspSagaConfig(), branch = "main" })
	use({ "jose-elias-alvarez/typescript.nvim" })
	use({ "onsails/lspkind.nvim" })

	-- OVER OBSERVATION
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use({ "ray-x/lsp_signature.nvim" })
	use({ "ixru/nvim-markdown" })
	use({ "barreiroleo/ltex-extra.nvim" })
	use({ "kamykn/spelunker.vim", requires = { "kamykn/popup-menu.nvim" } })
	use({ "preservim/vim-pencil" })
	use({ "lervag/vimtex" })
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-treesitter/nvim-treesitter" } },
	})
	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
	})
end)

----------------------------------------------------
-- OVER OBSERVATION configs
----------------------------------------------------
-- package-info
vim.api.nvim_set_keymap(
	"n",
	"<leader>ns",
	"<cmd>lua require('package-info').show()<cr>",
	{ silent = true, noremap = true }
)

--vimtex
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0
-- vim.g.vimtex_view_skim_sync = 1
-- vim.g.vimtex_view_skim_activate = 1

-- vim pencil
vim.g["pencil#autoformat"] = 0

-- spelunker
glo.enable_spelunker_vim = 0

-- refactoring
require("refactoring").setup({})

-- lsp signature
require("lsp_signature").setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
	hint_enable = false,
	transparency = 50,
	floating_window = false,
	toggle_key = "<M-f>",
})
