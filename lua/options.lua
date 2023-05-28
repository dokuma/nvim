local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	shell = "zsh",

	title = true,
	cmdheight = 1,
	mouse = "a", -- Set enable mouse in all mode.
	showmode = true,
	showtabline = 2,
	termguicolors = true,
	cursorline = true,
	relativenumber = false,
	number = true,
	numberwidth = 4,
	signcolumn = "auto",
	wrap = true,
	winblend = 0,
	wildoptions = "pum",
	pumblend = 5,
	background = "dark",
	guifont = "BitstromWera Nerd Font:h12",

	backup = false,
	backupskip = { "/tmp/*", "/private/tmp/*" },
	swapfile = false,
	writebackup = false,
	undofile = true,

	clipboard = "unnamedplus",

	completeopt = { "menuone", "noselect" }, -- Set complete behavior

	conceallevel = 0, -- Set conceal level: I always would like to see the text as looks orginal.
	pumheight = 10,

	hlsearch = true,
	ignorecase = true,
	smartcase = true, -- Set weather override behavior for ignore case.

	updatetime = 4000,
	timeoutlen = 1000,

	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	smartindent = true,

	scrolloff = 8,
	sidescrolloff = 8,

	splitbelow = true,
	splitright = true,
}

vim.opt.shortmess:append("c")

for k,v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l") -- ?
vim.cmd([[set iskeyword+=-]]) -- Set how recognize word: '-' going to be added.
