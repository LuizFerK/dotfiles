local keymap = vim.keymap

return {
	"mhartington/formatter.nvim",
	opts = function()
		local function mix_format()
			return { exe = "mix", args = { "format", "mix.exs", "-" }, stdin = true }
		end

		local function terraform()
			return { exe = "terraform", args = { "fmt", "-write=false" }, stdin = true }
		end

		local function nix()
			return { exe = "nix", args = { "fmt" }, stdin = true }
		end

		local stylua = require("formatter.filetypes.lua").stylua
		local prettier = require("formatter.filetypes.javascript").prettier
		local black = require("formatter.filetypes.python").black
		local rustfmt = {
			exe = "rustfmt --edition 2021",
			stdin = true,
		}

		return {
			logging = true,
			filetype = {
				elixir = { mix_format },
				lua = { stylua },
				javascript = { prettier },
				javascriptreact = { prettier },
				typescript = { prettier },
				typescriptreact = { prettier },
				vue = { prettier },
				html = { prettier },
				json = { prettier },
				css = { prettier },
				scss = { prettier },
				sass = { prettier },
				python = { black },
				rust = { rustfmt },
				terraform = { terraform },
				nix = { nix },
			},
		}
	end,
	config = function(_, opts)
		require("formatter").setup(opts)

		local key_opts = { noremap = true, silent = true }
		keymap.set("n", "<leader>f", ":Format<CR> :w<CR>", key_opts)
	end,
}
