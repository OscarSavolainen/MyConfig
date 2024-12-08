-- Used to define keymaps for Python files, e.g. inserting ipdb breakpoints, docstrings, etc.
local M = {}

function M.insert_indented_lines(lines)
    local current_line = vim.api.nvim_get_current_line()
    local indent = current_line:match("^%s*")
    
    local indented_lines = {}
    for _, line in ipairs(lines) do
        table.insert(indented_lines, indent .. line)
    end
    
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(0, row, row, false, indented_lines)
    vim.api.nvim_win_set_cursor(0, {row + #indented_lines, #indent})
    -- vim.cmd('startinsert!')
end

function M.insert_docstring()
    M.insert_indented_lines({
        '"""',
        '',
        '"""'
    })
end

function M.insert_ipdb_breakpoint()
    M.insert_indented_lines({
        'import ipdb; ipdb.set_trace()'
    })
end

return M
