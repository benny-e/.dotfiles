return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
			-- Neovim
			"lua",
			"luadoc",
			"vim",
			"vimdoc",
			"query",

			-- Linux / shell
			"bash",
			"awk",
			"ssh_config",
			"udev",
			"desktop",
			"hyprlang",
			"kitty",

			-- Config files
			"yaml",
			"json",
			"json5",
			"toml",
			"ini",
			"editorconfig",
			"csv",

			-- Documentation
			"markdown",
			"markdown_inline",

			-- Python
			"python",
			"requirements",

			-- Systems programming
			"c",
			"cpp",
			"asm",
			"nasm",
			"bpftrace",
			"make",
			"cmake",

			-- Rust
			"rust",

			-- Homelab / infrastructure
			"dockerfile",
			"nginx",
			"terraform",

			-- Web
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
			"scss",

			-- Data
			"sql",

			-- Misc useful stuff
			"regex",
			"diff",
			"jq",
			"http",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
