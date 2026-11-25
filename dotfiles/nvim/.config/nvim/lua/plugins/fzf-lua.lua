-- FZF-LUA
---------

local fzf = require("fzf-lua")

local ignored_extensions = {
    -- Images
    "%.jpg$",
    "%.jpeg$",
    "%.png$",
    "%.gif$",
    "%.webp$",
    "%.bmp$",
    "%.ico$",
    "%.tif$",
    "%.tiff$",
    "%.heic$",
    "%.avif$",

    -- Audio and video
    "%.mp3$",
    "%.wav$",
    "%.flac$",
    "%.ogg$",
    "%.opus$",
    "%.m4a$",
    "%.aac$",
    "%.mp4$",
    "%.mkv$",
    "%.mov$",
    "%.avi$",
    "%.webm$",

    -- Documents
    "%.pdf$",
    "%.doc$",
    "%.docx$",
    "%.xls$",
    "%.xlsx$",
    "%.ppt$",
    "%.pptx$",
    "%.odt$",
    "%.ods$",
    "%.odp$",
    "%.rtf$",
    "%.epub$",

    -- Archives
    "%.zip$",
    "%.7z$",
    "%.rar$",
    "%.tar$",
    "%.gz$",
    "%.bz2$",
    "%.xz$",
    "%.zst$",

    -- Compiled files and binaries
    "%.exe$",
    "%.dll$",
    "%.so$",
    "%.dylib$",
    "%.o$",
    "%.a$",
    "%.class$",
    "%.pyc$",
    "%.wasm$",

    -- Fonts
    "%.ttf$",
    "%.otf$",
    "%.woff$",
    "%.woff2$",
}

fzf.setup({
    files = {
        file_ignore_patterns = ignored_extensions,
    },

    grep = {
        rg_glob = false,
        file_ignore_patterns = ignored_extensions,
    },

    -- winopts = {
    --     preview = {
    --         hidden = true,
    --     },
    -- },
})

-- Keymaps
vim.keymap.set("n", "<leader>F", fzf.files, {
    desc = "Find Files",
})

vim.keymap.set("n", "<leader>G", fzf.live_grep, {
    desc = "Live Grep",
})
