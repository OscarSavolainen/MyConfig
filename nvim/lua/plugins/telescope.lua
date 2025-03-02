local mapkey = require("util.keymapper").mapkey

local config = function()
    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
            -- You can also add these for a larger default size
            layout_config = {
                width = 0.9,
                height = 0.9,
            },
        },
        pickers = {
            find_files = {
                hidden = true,
            },
            live_grep = {},
            buffers = {},
        },
    })
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config,
    keys = {
        mapkey("<leader>fk", "Telescope keymaps", "n"),
        mapkey("<leader>fh", "Telescope help_tags", "n"),
        mapkey("<leader>ff", "Telescope find_files", "n"),
        mapkey("<leader>fg", "Telescope live_grep", "n"),
        mapkey("<leader>fb", "Telescope buffers", "n"),
    },
}
