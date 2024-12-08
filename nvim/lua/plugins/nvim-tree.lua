return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
      -- If I wanted the tree on the right, I kinda like it on the left though
			-- view = {
			-- 	side = "right",
			-- },
		})
	end,
}
