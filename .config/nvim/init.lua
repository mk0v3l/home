-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.cmd("source ~/.config/nvim/cop.vim")

vim.g.tutor_is_loaded = 1
vim.cmd.colorscheme("habamax")
-- vim.cmd(":RltvNmbr")
-- function hidenotif()
--     require("notify").dismiss({ silent = true, pending = true })
-- end
-- hidenotif()

vim.g.floaterm_width = 120
vim.g.floaterm_height = 35
vim.g.floaterm_autoclose = 0
local ranger_nvim = require("ranger-nvim")
ranger_nvim.setup({
    enable_cmds = true,
    -- replace_netrw = false,
    -- keybinds = {
    -- ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
    -- ["oh"] = ranger_nvim.OPEN_MODE.split,
    -- ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
    -- ["or"] = ranger_nvim.OPEN_MODE.rifle,
    -- },
    ui = {
        border = "none",
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
    },
})

require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    },
})

require("lualine").setup({
    options = {
        -- theme = "ayu_mirage",
        -- theme = "iceberg_dark",
        theme = "codedark",
    },
})

require("copilot").setup({
    panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            -- accept = "<CR>",
            accept = "<C-k>",
            refresh = "gr",
            open = "<M-CR>",
        },
        layout = {
            -- position = "bottom", -- | top | left | right
            position = "top", -- | top | left | right
            ratio = 0.4,
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<M-a>",
            accept_word = "<CR>",
            accept_line = "<C-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 18.x
    server_opts_overrides = {},
})
