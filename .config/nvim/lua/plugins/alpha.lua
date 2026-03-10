return {
	"goolord/alpha-nvim",
	event = "VimEnter",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#1793D1", bold = true })
		vim.api.nvim_set_hl(0, "AlphaDate", { fg = "#b0b0b0" })
		vim.api.nvim_set_hl(0, "AlphaSystemText", { fg = "#9aa0a6" })

		dashboard.section.header.val = {
			"  Neovim",
		}

		dashboard.section.header.opts = {
			position = "center",
			hl = "AlphaHeader",
		}

		local datetime = {
			type = "text",
			val = os.date("%A, %B %d, %Y  •  %I:%M %p"),
			opts = {
				position = "center",
				hl = "AlphaDate",
			},
		}

		local uname = vim.loop.os_uname()
		local version = vim.version()

		local plugin_count = 0
		local ok, lazy = pcall(require, "lazy")
		if ok and lazy.stats then
			plugin_count = lazy.stats().count or 0
		end

		local system = {
			type = "text",
			val = {
				"󰣇  Arch Linux",
				"  Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch,
				"  " .. uname.machine,
				"󰌢  Kernel " .. uname.release,
				"󰐱  Plugins " .. plugin_count,
				"  " .. vim.fn.getcwd(),
			},
			opts = {
				position = "center",
				hl = "AlphaSystemText",
			},
		}

		local function build_layout()
			local win_h = vim.fn.winheight(0)

			local header_h = #dashboard.section.header.val
			local datetime_h = 1
			local system_h = #system.val
			local gap_h = 1 + 2
			local content_h = header_h + datetime_h + system_h + gap_h

			local top_pad = math.max(0, math.floor((win_h - content_h) / 2) - 1)
			local bottom_pad = math.max(0, win_h - content_h - top_pad)

			dashboard.config.layout = {
				{ type = "padding", val = top_pad },
				dashboard.section.header,
				{ type = "padding", val = 1 },
				datetime,
				{ type = "padding", val = 2 },
				system,
				{ type = "padding", val = bottom_pad },
			}
		end

		build_layout()

		dashboard.config.opts = dashboard.config.opts or {}
		dashboard.config.opts.noautocmd = true

		alpha.setup(dashboard.config)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt_local.cursorline = false
				vim.opt_local.cursorcolumn = false
				vim.opt_local.number = false
				vim.opt_local.relativenumber = false
				vim.opt_local.signcolumn = "no"
				vim.opt_local.foldcolumn = "0"
				vim.opt_local.list = false
				vim.opt_local.wrap = false
				vim.opt_local.scrolloff = 0
				vim.opt_local.sidescrolloff = 0
				vim.opt_local.laststatus = 0
				vim.opt_local.fillchars = "eob: "
				vim.cmd("silent! setlocal nocursorcolumn nocursorline")
				vim.api.nvim_set_hl(0, "InvisibleCursor", { blend = 100 })
			end,
		})

		vim.api.nvim_create_autocmd("BufUnload", {
			pattern = "<buffer>",
			callback = function()
			end,
		})

		vim.api.nvim_create_autocmd("VimResized", {
			callback = function()
				if vim.bo.filetype == "alpha" then
					build_layout()
					pcall(vim.cmd, "AlphaRedraw")
					vim.cmd("normal! zz")
				end
			end,
		})
	end,
}
