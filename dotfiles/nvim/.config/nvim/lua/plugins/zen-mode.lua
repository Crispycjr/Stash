-- ZEN-MODE
-----------

require("zen-mode").setup({
    window = {
        backdrop = 1,
        width = 0.60,
        height = 0.90,

        options = {
            signcolumn = "no",
            number = false,
        },
    },
})

vim.keymap.set("n", "<leader>r", "<cmd>ZenMode<CR>", {
    silent = true,
    desc = "Toggle Zen Mode",
})
