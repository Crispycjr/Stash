-- TFM
------

require("tfm").setup({
    file_manager = "yazi",
    replace_netrw = true,

    ui = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.4,
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("tfm").open()
end, { desc = "Open file manager" })
