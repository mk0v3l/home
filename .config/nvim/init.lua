-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.cmd("source ~/.config/nvim/cop.vim")
-- require("spaceless").setup()
vim.g.tutor_is_loaded = 1
vim.cmd.colorscheme("tokyonight-night")
vim.opt.mouse = ""
-- vim.cmd(":RltvNmbr")
-- os.execute("! ~/.keyrepeatfast.sh")
-- vim.cmd("! ~/.keyrepeatfast.sh")
-- function hidenotif()
--     require("notify").dismiss({ silent = true, pending = true })
-- end
-- hidenotif()
-- blbl

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

-- vim.o.completeopt = "menuone,noselect,preview"
local cmp = require("cmp")
cmp.setup({
    preselect = cmp.PreselectMode.None,
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
})

-- local configGPT = { openai_api_key = os.getenv("GPT_KEY_NEOVIM") }
-- require("gp").setup(configGPT)
-- require("gp").setup({ openai_api_key = os.getenv("GPT_KEY_NEOVIM") })
-- require("gp").setup({ openai_api_key = "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" })

-- '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'
-- require("copilot").setup({
--     panel = {
--         enabled = false,
--         auto_refresh = false,
--         keymap = {
--             jump_prev = "[[",
--             jump_next = "]]",
--             -- accept = "<CR>",
--             accept = "<C-k>",
--             refresh = "gr",
--             open = "<M-CR>",
--         },
--         layout = {
--             -- position = "bottom", -- | top | left | right
--             position = "top", -- | top | left | right
--             ratio = 0.4,
--         },
--     },
--     suggestion = {
--         enabled = true,
--         auto_trigger = true,
--         debounce = 75,
--         keymap = {
--             accept = "<M-a>",
--             accept_word = "<CR>",
--             accept_line = "<C-l>",
--             next = "<M-]>",
--             prev = "<M-[>",
--             dismiss = "<C-]>",
--         },
--     },
--     filetypes = {
--         yaml = false,
--         markdown = false,
--         help = false,
--         gitcommit = false,
--         gitrebase = false,
--         hgcommit = false,
--         svn = false,
--         cvs = false,
--         ["."] = false,
--     },
--     copilot_node_command = "node", -- Node.js version must be > 18.x
--     server_opts_overrides = {},
-- })

-- local cmp = require("cmp")
-- local defaults = require("cmp.config.default")()
-- return {
--     completion = {
--         completeopt = "menu,menuone,noinsert",
--     },
--     snippet = {
--         expand = function(args)
--             require("luasnip").lsp_expand(args.body)
--         end,
--     },
--     mapping = cmp.mapping.preset.insert({
--         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.abort(),
--         ["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--         ["<S-CR>"] = cmp.mapping.confirm({
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--         }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--         ["<C-CR>"] = function(fallback)
--             cmp.abort()
--             fallback()
--         end,
--     }),
--     sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "path" },
--     }, {
--         { name = "buffer" },
--     }),
--     formatting = {
--         format = function(_, item)
--             local icons = require("lazyvim.config").icons.kinds
--             if icons[item.kind] then
--                 item.kind = icons[item.kind] .. item.kind
--             end
--             return item
--         end,
--     },
--     experimental = {
--         ghost_text = {
--             hl_group = "CmpGhostText",
--         },
--     },
--     sorting = defaults.sorting,
-- }
-- end,

-- local Popup = require("nui.popup")
-- local event = require("nui.utils.autocmd").event

-- local popup = Popup({
--     enter = false,
--     focusable = true,
--     -- enter = true,
--     -- focusable = false,
--     border = {
--         style = "none",
--     },
--     position = {
--         row = 1,
--         col = 100,
--     },
--     size = {
--         -- width = "45%", -- nonum
--         -- height = "21%", -- nonum
--         width = "45%",
--         height = "25%",
--     },
-- })
-- local ok = popup:map("n", "<esc>", function(bufnr)
--     -- print("ESC pressed in Normal mode!")
--     popup:hide()
-- end, { noremap = true })
-- -- local ok = popup:unmap("n", "<esc>")
-- -- mount/open the component
-- popup:mount()

-- -- unmount component when cursor leaves buffer
-- popup:on(event.BufLeave, function()
--     popup:unmount()
-- end)

-- local nonummaj = {
--     "┌─┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐",
--     "│ │ A │ Z │ E │ R │ T │ Y │ U │ I │ O │ P │ { │ } │ | │",
--     "├─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴───┴───┤",
--     '│ Q │ S │ D │ F │ G │ H │ J │ K │ L │ M │ " │ <Enter> │',
--     "├─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─────────┤",
--     "│ │ W │ X │ C │ V │ B │ N │ : │ < │ > │ ? │  <Shift>  │",
--     "└─┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───────────┘",
-- }
-- local nonum = {
--     "┌─┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐",
--     "│ │ a │ z │ e │ r │ t │ y │ u │ i │ o │ p │ [ │ ] │ \\ │",
--     "├─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴───┴───┤",
--     "│ q │ s │ d │_f_│ g │ h │_j_│ k │ l │ m │ ' │ <Enter> │",
--     "├─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─────────┤",
--     "│ │ w │ x │ c │ v │ b │ n │ ; │ , │ . │ / │  <Shift>  │",
--     "└─┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───────────┘",
-- }

-- local nummaj = {
--     "┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐",
--     "│ ~ │ ! │ @ │ # │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │",
--     "└─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┐",
--     "  │ A │ Z │ E │ R │ T │ Y │ U │ I │ O │ P │ { │ } │ | │",
--     "┌─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴───┴───┤",
--     '│ Q │ S │ D │_F_│ G │ H │_J_│ K │ L │ M │ " │ <Enter> │',
--     "└─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─────────┤",
--     "  │ W │ X │ C │ V │ B │ N │ : │ < │ > │ ? │  <Shift>  │",
--     "  └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───────────┘",
-- }
-- local num = {
--     "┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐",
--     "│ ` │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │",
--     "└─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┐",
--     "  │ a │ z │ e │ r │ t │ y │ u │ i │ o │ p │ [ │ ] │ \\ │",
--     "┌─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴───┴───┤",
--     "│ q │ s │ d │_f_│ g │_h_│ j │ k │ l │ m │ ' │ <Enter> │",
--     "└─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─────────┤",
--     "  │ w │ x │ c │ v │ b │ n │ ; │ , │ . │ / │  <Shift>  │",
--     "  └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───────────┘",
-- }

-- -- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, nonum)
-- -- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, nonummaj)
-- -- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, num)
-- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, nummaj)
