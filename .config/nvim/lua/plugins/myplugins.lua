local Util = require("lazyvim.util")
function os.capture(cmd, raw)
    local handle = assert(io.popen(cmd, "r"))
    local output = assert(handle:read("*a"))
    handle:close()
    if raw then
        return output
    end
    output = string.gsub(string.gsub(string.gsub(output, "^%s+", ""), "%s+$", ""), "[\n\r]+", " ")
    return output
end
-- local citation = os.capture("motivate --no-colors", true)
local citation = os.capture("fortune", true)

return {
    -- { "zbirenbaum/copilot", enabled = false },
    -- { "zbirenbaum/copilot-cmp", enabled = false },
    -- { "zbirenbaum/copilot.lua", enabled = false },
    "kdheepak/lazygit.nvim",
    -- "github/copilot.vim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    "vim-scripts/RltvNmbr.vim",
    "voldikss/vim-floaterm",
    "terryma/vim-multiple-cursors",
    "tpope/vim-commentary",

    "kelly-lin/ranger.nvim",
    config = function()
        require("ranger-nvim").setup({ replace_netrw = true })
        vim.api.nvim_set_keymap("n", "<leader>ef", "", {
            noremap = true,
            callback = function()
                require("ranger-nvim").open(true)
            end,
        })
    end,

    {

        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function()
            -- local logo = [[
            --      ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
            --      ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
            --      ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
            --      ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
            --      ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
            --      ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
            -- ]]
            local logo = [[
      ███╗   ███╗██╗  ██╗ ██████╗ ██╗   ██╗██████╗ ██╗     
      ████╗ ████║██║ ██╔╝██╔═████╗██║   ██║╚════██╗██║     
      ██╔████╔██║█████╔╝ ██║██╔██║██║   ██║ █████╔╝██║     
      ██║╚██╔╝██║██╔═██╗ ████╔╝██║╚██╗ ██╔╝ ╚═══██╗██║     
      ██║ ╚═╝ ██║██║  ██╗╚██████╔╝ ╚████╔╝ ██████╔╝███████╗
      ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═════╝ ╚══════╝
      ]]
            -- logo = string.rep("\n", 8) .. logo .. "\n\n"
            logo = string.rep("\n", 1) .. logo .. "\n\n" .. citation .. "\n\n"
            -- logo = logo .. "\n\n" .. citation .. "\n\n"

            local opts = {
                theme = "doom",
                hide = {
                    -- this is taken care of by lualine
                    -- enabling this messes up the actual laststatus setting after loading a file
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
            { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = 'e /home/mkovel/.config/nvim/vimtutor.txt',                        desc = " Vim Tutor", icon = "🎓", key = "t" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return {
                            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
                        }
                    end,
                },
            }

            for _, button in ipairs(opts.config.center) do
                button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
                button.key_format = "  %s"
            end

            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "DashboardLoaded",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            return opts
        end,
    },

    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>n",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss all Notifications",
            },
        },
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        },
        init = function()
            -- when noice is not enabled, install notify on VeryLazy
            if not Util.has("noice.nvim") then
                Util.on_very_lazy(function()
                    vim.notify = require("notify")
                end)
            end
        end,
    },
}
