-- TREESITTER
-------------

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = {
    "bash",
    "c",
    "dockerfile",
    -- "gitignore",
    "html",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "vim",
    "vimdoc",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "c",
        "dockerfile",
        -- "gitcommit",
        -- "gitignore",
        "html",
        "lua",
        "markdown",
        "python",
        "query",
        "regex",
        "vim",
        "help",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
