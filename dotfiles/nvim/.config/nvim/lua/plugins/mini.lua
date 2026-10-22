-- MINI.STARTER
---------------

local nvim_version = string.format(
    "Neovim v%d.%d.%d",
    vim.version().major,
    vim.version().minor,
    vim.version().patch
)

local starter = require("mini.starter")

starter.setup({
    evaluate_single = true,

    header = table.concat({
        [[               _         ]],
        [[   ____ _   __(_)___ ___ ]],
        [[  / __ \ | / / / __ `__ \]],
        [[ / / / / |/ / / / / / / /]],
        [[/_/ /_/|___/_/_/ /_/ /_/ ]],
        [[                         ]],
    }, "\n"),

    items = {
        { name = "Empty Buffer", action = "enew", section = "" },
        { name = "Recent Files", action = "FzfLua oldfiles", section = "" },
        { name = "Find File", action = "FzfLua files", section = "" },
        { name = "Grep Text", action = "FzfLua live_grep", section = "" },
        { name = "Notes", action = "edit $HOME/Documents/notes/.", section = "" },
        { name = "TODO", action = "edit $HOME/Documents/notes/TODO.md", section = "" },
        { name = "Scratch", action = "edit $HOME/Documents/notes/scratch.md", section = "" },
        { name = "Configure", action = "edit $HOME/.config/nvim/.", section = "" },
        { name = "Update", action = "lua vim.pack.update()", section = "" },
        { name = "Quit", action = "q", section = "" },
    },

    content_hooks = {
        starter.gen_hook.adding_bullet(">  "),
        starter.gen_hook.aligning("center", "center"),
    },

    footer = nvim_version,
    silent = true,
})

-- Starter navigation with j/k
vim.api.nvim_create_augroup("MiniStarterJK", { clear = true })

vim.api.nvim_create_autocmd("User", {
    group = "MiniStarterJK",
    pattern = "MiniStarterOpened",
    callback = function()
        vim.keymap.set("n", "j", function()
            starter.update_current_item("next")
        end, { buffer = true, desc = "Next starter item" })

        vim.keymap.set("n", "k", function()
            starter.update_current_item("prev")
        end, { buffer = true, desc = "Previous starter item" })
    end,
})


-- MINI.STATUSLINE
------------------

require("mini.statusline").setup({
    use_icons = true,
})


-- MINI.COMMENT
---------------

require("mini.comment").setup({
    options = {
        ignore_blank_line = true,
    },
})


-- MINI.DIFF
------------

require("mini.diff").setup({
    view = {
        style = "sign",
        signs = {
            add = "+",
            change = "~",
            delete = "_",
        },
    },

    delay = {
        text_change = 50,
    },
})


-- MINI.HIPATTERNS
------------------

local hipatterns = require("mini.hipatterns")

hipatterns.setup({
    highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
    },

    delay = {
        text_change = 50,
    },
})


-- OTHER MINI MODULES
---------------------

require("mini.ai").setup()
require("mini.extra").setup()
require("mini.git").setup()
require("mini.icons").setup()
require("mini.surround").setup()
