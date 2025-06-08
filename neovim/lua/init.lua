-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		require("plugins/plugins"),
		require("plugins/blink"),
		require("plugins.trouble"),
		require("plugins.neotree"),
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- various stuff
vim.cmd("colorscheme onedark")
vim.o.number = true
vim.o.cursorline = true
require("nvim-web-devicons").get_icons()

-- lsp
vim.lsp.enable("nixd")
vim.lsp.enable("lua_ls")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				-- #TODO should improve this so it only gets executed when actually inside a vim config
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.inlay_hint.enable()

vim.diagnostic.config({
	underline = false,
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰟃",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})
