-- TREESITTER
-------------

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = {
    "bash",
    "c",
    "dockerfile",
    "html",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "vim",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "c",
        "dockerfile",
        "html",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
