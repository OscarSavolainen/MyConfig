local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"basedpyright",
		"lua_ls",
    "gopls"
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
