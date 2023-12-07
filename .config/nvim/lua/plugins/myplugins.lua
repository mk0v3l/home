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
-- local configGpt = { openai_api_key = os.getenv("GPT_KEY_NEOVIM") }

return {
    -- { "zbirenbaum/copilot", enabled = false },
    -- { "zbirenbaum/copilot-cmp", enabled = false },
    -- { "zbirenbaum/copilot.lua", enabled = false },
    "myusuf3/numbers.vim",
    "yuratomo/w3m.vim",
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
            local logo = [[


███╗   ███╗██╗  ██╗ ██████╗ ██╗   ██╗██████╗ ██╗     
████╗ ████║██║ ██╔╝██╔═████╗██║   ██║╚════██╗██║     
██╔████╔██║█████╔╝ ██║██╔██║██║   ██║ █████╔╝██║     
██║╚██╔╝██║██╔═██╗ ████╔╝██║╚██╗ ██╔╝ ╚═══██╗██║     
██║ ╚═╝ ██║██║  ██╗╚██████╔╝ ╚████╔╝ ██████╔╝███████╗
╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═════╝ ╚══════╝
                                                     
]]
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
            -- 🎮
            --FloatermNew  gord <CR>
  -- "github":  󰙯    󰮗     󰁫   󰱼 󰙰 󱁼  󰒲   󱨡 🎓 󱨠   󰦛   󰐔 󰖟 󰥨  󰫿 󰟔 󱘭     
-- FloatermNew  w3m google.com<CR>", { silent = true, desc = "Internet Browser" })
            {action = "LazyGit",                                                   desc = " LazyGit",         icon = " ", key = "z" },
            {action = "FloatermNew w3m google.com",                                desc = " Internet Browser",icon = "󰖟 ", key = "i" },
            {action = "FloatermNew  ~/.gord/gord",                                 desc = " DisGord",         icon = "󰙯 ", key = "d" },
            { action = "FloatermNew  ranger",                                      desc = " Ranger",          icon = " ", key = "R" },
            -- { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "ene | file |startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope find_files",                                     desc = " Find file",       icon = "󰥨 ", key = "f" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = "󰙰 ", key = "r" },
            { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config files",    icon = " ", key = "c" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = "󰱼 ", key = "/" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Last Session", icon = "󰦛 ", key = "s" },
            -- {action = "FloatermNew lazygit",                                       desc = " LazyGit",         icon = " ", key = "z" },
            { action = 'e /home/mkovel/.config/nvim/vimtutor.txt',                 desc = " Vim Tutor",       icon = "🎓", key = "t" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
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

    -- "github":  󰙯    󰮗     󰁫   󰱼 󰙰 󱁼  󰒲   󱨡 🎓 󱨠   󰦛   󰐔 󰖟 󰥨  󰫿 󰟔 󱘭     
    {
        "folke/which-key.nvim",
        -- event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
            defaults = {
                mode = { "n", "v" },
                ["g"] = { name = " 󰇐 goto" },
                ["gs"] = { name = "+surround" },
                ["]"] = { name = " 󰒭 next" },
                ["["] = { name = " 󰒮 prev" },
                ["<leader><tab>"] = { name = " 󰓩 tabs" },
                ["<leader>b"] = { name = "  buffer" },
                ["<leader>c"] = { name = "  code" },
                ["<leader>cc"] = { name = "         Compile" },
                ["<leader>f"] = { name = " 󰱼 file/find" },
                ["<leader>g"] = { name = "  git" },
                ["<leader>gh"] = { name = "+hunks" },
                ["<leader>q"] = { name = "  quit/session" },
                ["<leader>s"] = { name = "  search" },
                ["<leader>u"] = { name = " 󰨚 ui" },
                ["<leader>w"] = { name = "  windows" },
                ["<leader>x"] = { name = "  diagnostics/quickfix" },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },

    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "<leader>cl", false }
        end,
    },

    {
        "echasnovski/mini.ai",
        -- keys = {
        --   { "a", mode = { "x", "o" } },
        --   { "i", mode = { "x", "o" } },
        -- },
        event = "VeryLazy",
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }, {}),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
                    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
                },
            }
        end,
        config = function(_, opts)
            require("mini.ai").setup(opts)
            -- register all text objects with which-key
            require("lazyvim.util").on_load("which-key.nvim", function()
                ---@type table<string, string|table>
                local i = {
                    -- 󰅩󰅪󰊕
                    [" "] = "Whitespace",
                    ['"'] = 'Balanced "',
                    ["'"] = "Balanced '",
                    ["`"] = "Balanced `",
                    ["("] = "Balanced (",
                    [")"] = "Balanced ) including white-space",
                    [">"] = "Balanced > including white-space",
                    ["<lt>"] = "Balanced <",
                    ["]"] = "Balanced ] including white-space",
                    ["["] = "Balanced [",
                    ["}"] = "Balanced } including white-space",
                    ["{"] = "Balanced {",
                    ["?"] = "User Prompt",
                    _ = "Underscore",
                    a = "Argument",
                    b = " 󰅲 󰅩 󰅪",
                    -- b = " 󰅲 󰅩 󰅪 Balanced ), ], }",
                    c = "  Class",
                    f = " 󰊕 Function",
                    o = "Block, conditional, loop",
                    q = "  ",
                    -- q = "  Quote `, \", '",
                    t = "Tag",
                }
                local a = vim.deepcopy(i)
                for k, v in pairs(a) do
                    a[k] = v:gsub(" including.*", "")
                end

                local ic = vim.deepcopy(i)
                local ac = vim.deepcopy(a)
                for key, name in pairs({ n = "Next", l = "Last" }) do
                    i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
                    a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
                end
                require("which-key").register({
                    mode = { "o", "x" },
                    i = i,
                    a = a,
                })
            end)
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    -- accept = "<S-Tab>",
                    -- accept = "<Tab>",
                    -- accept = "<C-z>",
                    -- accept = "<C-left>",
                    accept = "<C-right>",
                    accept_line = "<C-l>",
                    -- accept_line = "<C-down>",
                    accept_word = "<C-o>",
                    next = "<C-]>",
                    prev = "<C-[>",
                    dismiss = "<M-c>",
                },
            },
            panel = {
                enabled = false,
                auto_refresh = true,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "r",
                    open = "<C-i>",
                },
            },
        },
    },

    -- auto completion
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",

            {
                "zbirenbaum/copilot-cmp",
                dependencies = "copilot.lua",
                opts = {},
                config = function(_, opts)
                    local copilot_cmp = require("copilot_cmp")
                    copilot_cmp.setup(opts)
                    -- attach cmp source whenever copilot attaches
                    -- fixes lazy-loading issues with the copilot cmp source
                    require("lazyvim.util").lsp.on_attach(function(client)
                        if client.name == "copilot" then
                            copilot_cmp._on_insert_enter({})
                        end
                    end)
                end,
            },
        },

        -- -@param opts cmp.ConfigSchema
        -- opts = function(_, opts)
        -- table.insert(opts.sources, 1, {
        --     name = "copilot",
        --     group_index = 1,
        --     priority = 100,
        -- })
        -- end,

        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<S-CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-CR>"] = function(fallback)
                        cmp.abort()
                        fallback()
                    end,
                }),
                sources = cmp.config.sources({
                    {
                        name = "copilot",
                        group_index = 1,
                        priority = 100,
                    },

                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    format = function(_, item)
                        local icons = require("lazyvim.config").icons.kinds
                        if icons[item.kind] then
                            item.kind = icons[item.kind] .. item.kind
                        end
                        return item
                    end,
                },
                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },
                sorting = defaults.sorting,
            }
        end,
        ---@param opts cmp.ConfigSchema
        config = function(_, opts)
            for _, source in ipairs(opts.sources) do
                source.group_index = source.group_index or 1
            end
            require("cmp").setup(opts)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "K", false }
        end,
    },
    --
    --
    {
        "robitx/gp.nvim",
    },

    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cM", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
                -- "flake8",
            },
        },
    },

    -- require("gp").setup(config),
    -- local config = {
    -- openai_api_key = os.getenv("GPT_KEY_NEOVIM") ,
    -- }
    -- config = function ()
    -- end
    -- require("gp").setup({ openai_api_key = os.getenv("GPT_KEY_NEOVIM") }),
    -- config = function()
    -- {
    -- openai_api_key = os.getenv("GPT_KEY_NEOVIM"),
    -- }}
    -- or setup with your own config (see Install > Configuration in Readme)
    -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    -- end,
    -- },

    -- Use <tab> for completion and snippets (supertab)
    -- first: disable default <tab> and <s-tab> behavior in LuaSnip
    --{
    --    "L3MON4D3/LuaSnip",
    --    keys = function()
    --        return {}
    --    end,
    --},
    ---- then: setup supertab in cmp
    --{
    --    "hrsh7th/nvim-cmp",
    --    dependencies = {
    --        "hrsh7th/cmp-emoji",
    --    },
    --    ---@param opts cmp.ConfigSchema
    --    opts = function(_, opts)
    --        local has_words_before = function()
    --            unpack = unpack or table.unpack
    --            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --            return col ~= 0
    --                and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    --        end

    --        local luasnip = require("luasnip")
    --        local cmp = require("cmp")

    --        opts.mapping = vim.tbl_extend("force", opts.mapping, {
    --            ["<Tab>"] = cmp.mapping(function(fallback)
    --                if cmp.visible() then
    --                    cmp.select_next_item()
    --                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
    --                -- this way you will only jump inside the snippet region
    --                elseif luasnip.expand_or_jumpable() then
    --                    luasnip.expand_or_jump()
    --                elseif has_words_before() then
    --                    cmp.complete()
    --                else
    --                    fallback()
    --                end
    --            end, { "s" }),
    --            -- end, { "i", "s" }),
    --            ["<S-Tab>"] = cmp.mapping(function(fallback)
    --                if cmp.visible() then
    --                    cmp.select_prev_item()
    --                elseif luasnip.jumpable(-1) then
    --                    luasnip.jump(-1)
    --                else
    --                    fallback()
    --                end
    --            end, { "s" }),
    --            -- end, { "i", "s" }),
    --        })
    --    end,
    --},
}
