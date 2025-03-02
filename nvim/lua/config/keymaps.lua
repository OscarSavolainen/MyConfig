local mapkey = require("util.keymapper").mapkey

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Buffer Deletion
mapkey("<leader>bd", "bdelete", "n") -- Remove current buffer from buffer list

-- Directory Navigation
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- -- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- NavigateDown
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- NavigateUp
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- -- Window Management
-- mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
-- mapkey("<leader>sh", "split", "n") -- Split Horizontally
-- mapkey("<leader>sm", "MaximizerToggle", "n") -- Toggle Minimize
-- mapkey("<C-Up>", "resize +2", "n")
-- mapkey("<C-Down>", "resize -2", "n")
-- mapkey("<C-Left>", "vertical resize +2", "n")
-- mapkey("<C-Right>", "vertical resize -2", "n")

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Notes
mapkey("<leader>ng", "Neorg workspace general", "n")
mapkey("<leader>nw", "Neorg workspace work", "n")
mapkey("<leader>ny", "Neorg workspace youtube", "n")


-- Insert Python docstring with auto-indentation
-- NOTE: Still A WIP
vim.api.nvim_set_keymap('n', '<leader>ds', [[<cmd>lua require('util.keymaps_py').insert_docstring()<CR>]], { noremap = true, silent = true })

-- Insert a Python ipdb breakpoint with auto-indentation
vim.api.nvim_set_keymap('n', '<leader>ip', [[<cmd>lua require('util.keymaps_py').insert_ipdb_breakpoint()<CR>]], { noremap = true, silent = true })

-- Insert linebreak 100 characters from start of line (doesn't split last word)
vim.api.nvim_set_keymap('n', '<leader>lb', '0100lBi<CR><ESC>', { noremap = true, silent = true })

-- Insert a standard Python indentation (4 spaces) at the start of the line
vim.api.nvim_set_keymap('n', '<leader>in', '0i<space><space><space><space><ESC>', { noremap = true, silent = true })

-- Go Delve debugging
-- vim.api.nvim_set_keymap('n', '<leader>db', 'cmd DapToggleBreakPoint <CR>', { noremap = true, silent = true })

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

local api = vim.api

-- -- Zen Mode
-- api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
-- api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
-- api.nvim_set_keymap("n", "<leader>sm", ":TZFocus<CR>", {})
-- api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
-- api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Comments
-- api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
-- api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })
--
--

-- Common patterns
-- Highlight work, paste buffer, and copy again
api.nvim_set_keymap("n", "Q", "viwpyiw", { noremap = true })

-- Function to resolve git conflicts by always selecting HEAD
function resolve_conflict_with_head()
  -- Search for the start of a conflict marker (<<<<<<< HEAD)
  vim.fn.search("<<<<<<< HEAD", "cW")
  
  -- Delete the conflict marker line
  vim.cmd("normal! dd")
  
  -- Find the separator line (=======)
  local start_line = vim.fn.line(".")
  vim.fn.search("=======", "W")
  
  -- Create a mark at the separator line
  local separator_line = vim.fn.line(".")
  
  -- Find the end of the conflict (>>>>>>> commit message)
  vim.fn.search(">>>>>>>", "W")
  local end_line = vim.fn.line(".")
  
  -- Delete from separator to end (including both lines)
  vim.cmd(separator_line .. "," .. end_line .. "delete")
  
  -- Return to where we were
  vim.cmd("normal! `")
end
vim.api.nvim_set_keymap(
  "n",
  "<leader>gh",
  "<cmd>lua resolve_conflict_with_head()<CR>",
  { noremap = true, silent = true, desc = "Resolve git conflict with HEAD" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gH",
  [[<cmd>g/<<<<<<< HEAD/norm! ddj:.,/=======\|->\|\(>>>>>>>\)/g/=======\|>>>>>>>/d<CR>]],
  { noremap = true, silent = true, desc = "Resolve all git conflicts with HEAD in file" }
)

-- Auto-format
vim.keymap.set("n", "<leader>o", function()
    local efm = vim.lsp.get_active_clients({ name = "efm" })

    if vim.tbl_isempty(efm) then
        return
    end

    vim.lsp.buf.format({ name = "efm", async = true })
end, { noremap = true, silent = true, desc = "Auto-format file" })


-- Copilot toggle
api.nvim_create_user_command("CopilotToggle", function()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  if vim.g.copilot_enabled then
    vim.cmd("Copilot enable")
    print("Copilot ON")
  else
    vim.cmd("Copilot disable")
    print("Copilot OFF")
  end
end, { nargs = 0 })

vim.keymap.set("n", "<leader>cp", ":CopilotToggle<CR>", { noremap = true, silent = true })
