return {
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
			})
			require("onedark").load()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			local theme = require("lualine.themes.onedark")

			theme.normal.a = {
				bg = "#4c566a",
				fg = "#050709",
				gui = "bold",
			}

			theme.insert.a = {
				bg = "#d24646",
				fg = "#050709",
				gui = "bold",
			}

			theme.visual.a = {
				bg = "#c678dd",
				fg = "#050709",
				gui = "bold",
			}

			theme.replace.a = {
				bg = "#d24646",
				fg = "#050709",
				gui = "bold",
			}

			theme.command.a = {
				bg = "#e5c07b",
				fg = "#050709",
				gui = "bold",
			}

			return {
				options = {
					theme = theme,
				},
			}
		end,
	}
}
