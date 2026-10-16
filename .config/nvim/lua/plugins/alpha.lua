return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			vim.api.nvim_set_hl(0, "AlphaBlue", {
				fg = "#61afef",
				bold = true,
			})

			vim.api.nvim_set_hl(0, "AlphaGreen", {
				fg = "#63d297",
				bold = true,
			})

			vim.api.nvim_set_hl(0, "AlphaButtons", {
				fg = "#c8c8c8",
			})

			vim.api.nvim_set_hl(0, "AlphaShortcut", {
				fg = "#61afef",
				bold = true,
			})

			vim.api.nvim_set_hl(0, "AlphaFooter", {
				fg = "#6f927f",
				italic = true,
			})

			dashboard.section.header.val = {
				[[                                                        ]],
				[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
				[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
				[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
				[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
				[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
				[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
				[[                                                        ]],
			}

			-- Alternate the logo between blue and green
			dashboard.section.header.opts.hl = {
				{ { "AlphaBlue", 0, -1 } },
				{ { "AlphaBlue", 0, -1 } },
				{ { "AlphaGreen", 0, -1 } },
				{ { "AlphaBlue", 0, -1 } },
				{ { "AlphaGreen", 0, -1 } },
				{ { "AlphaBlue", 0, -1 } },
				{ { "AlphaGreen", 0, -1 } },
				{ { "AlphaBlue", 0, -1 } },
			}

			dashboard.section.buttons.val = {
				dashboard.button(
					"f",
					"   Find file",
					":Telescope find_files<CR>"
				),

				dashboard.button(
					"g",
					"󰱼   Find text",
					":Telescope live_grep<CR>"
				),

				dashboard.button(
					"r",
					"   Recent files",
					":Telescope oldfiles<CR>"
				),

				dashboard.button(
					"c",
					"   Config",
					":cd " .. vim.fn.stdpath("config") .. " | Telescope find_files<CR>"
				),

				dashboard.button(
					"l",
					"󰒲   Lazy",
					":Lazy<CR>"
				),

				dashboard.button(
					"q",
					"   Quit",
					":qa<CR>"
				),
			}

			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.buttons.opts.hl_shortcut = "AlphaShortcut"

			local stats = require("lazy").stats()

			dashboard.section.footer.val = string.format(
				"Neovim %d.%d.%d  •  %d plugins loaded",
				vim.version().major,
				vim.version().minor,
				vim.version().patch,
				stats.loaded
			)

			dashboard.section.footer.opts.hl = "AlphaFooter"

			dashboard.config.layout = {
				{ type = "padding", val = 3 },
				dashboard.section.header,
				{ type = "padding", val = 2 },
				dashboard.section.buttons,
				{ type = "padding", val = 2 },
				dashboard.section.footer,
			}

			dashboard.config.opts.noautocmd = true

			alpha.setup(dashboard.config)
		end,
	},
}
