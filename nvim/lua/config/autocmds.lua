-- Autosave
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, { -- save after exit insert mode
	-- vim.api.nvim_create_autocmd({ "BufLeave" }, { -- save at exit
	pattern = { "*" },
	command = "silent! wall",
	nested = true,
})

-- Auto-format Go files on buffer leave
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*.go",
	callback = function()
		vim.cmd("silent! !gofmt -w %")
		vim.cmd("e") -- Reload the file
	end,
})

-- -- Auto-format on save
-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
-- -- vim.api.nvim_create_autocmd("BufWritePre", {
-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	group = lsp_fmt_group,
-- 	callback = function()
-- 		local efm = vim.lsp.get_active_clients({ name = "efm" })
--
-- 		if vim.tbl_isempty(efm) then
-- 			return
-- 		end
--
-- 		vim.lsp.buf.format({ name = "efm", async = true })
-- 	end,
-- })

-- Highlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYankGroup", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})
