-------------------------------------------------------------------------------------------------------------------
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-u>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-u>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-u>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / clear hlsearch / diff update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", ",", "<gv")
map("v", ".", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- formatting
map({ "n", "v" }, "<leader>cf", function()
    Util.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
map("n", "<leader>uf", function() Util.format.toggle() end, { desc = "Toggle auto format (global)" })
map("n", "<leader>uF", function() Util.format.toggle(true) end, { desc = "Toggle auto format (buffer)" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>uL", function() Util.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
map("n", "<leader>ul", function() Util.toggle.number() end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ud", function() Util.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
if vim.lsp.inlay_hint then
  map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
end
map("n", "<leader>uT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })

-- lazygit
map("n", "<leader>gg", function() Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function() Util.terminal({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- LazyVim Changelog
map("n", "<leader>L", function() Util.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end
-- local pythonrun = function() Util.terminal("ls", { cwd = Util.root() }) end
map("n", "<leader>fT", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>ft", function() Util.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
-- map("n", "<C-t>", lazyterm, { desc = "which_key_ignore" })
-- map("n", "<leader>t", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<leader>cP", pythonrun, { desc = "Python run" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<C-q>", "<cmd>close<cr>", { desc = "which_key_ignore" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
map("t", "<C-a>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>w\\", "<C-W>v", { desc = "which_key_ignore", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "which_key_ignore", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", ",m", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", ",l", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })












-------------------------------------------------------------------------------------------------------------------
local Util = require("lazyvim.util")
-- function os.capture(cmd, raw)
--   local handle = assert(io.popen(cmd, "r"))
--   local output = assert(handle:read("*a"))
--   handle:close()
--   if raw then
--     return output
--   end
--   output = string.gsub(string.gsub(string.gsub(output, "^%s+", ""), "%s+$", ""), "[\n\r]+", " ")
--   return output
-- end
-- -- local citation = os.capture("motivate --no-colors", true)
-- local citation = os.capture("fortune", true)

-- return {
  -- {
  --   "rcarriga/nvim-notify",
  --   keys = {
  --     {
  --       "<leader>n",
  --       function()
  --         require("notify").dismiss({ silent = true, pending = true })
  --       end,
  --       desc = "Dismiss all Notifications",
  --     },
  --   },
  --   opts = {
  --     timeout = 3000,
  --     max_height = function()
  --       return math.floor(vim.o.lines * 0.75)
  --     end,
  --     max_width = function()
  --       return math.floor(vim.o.columns * 0.75)
  --     end,
  --     on_open = function(win)
  --       vim.api.nvim_win_set_config(win, { zindex = 100 })
  --     end,
  --   },
  --   init = function()
  --     -- when noice is not enabled, install notify on VeryLazy
  --     if not Util.has("noice.nvim") then
  --       Util.on_very_lazy(function()
  --         vim.notify = require("notify")
  --       end)
  --     end
  --   end,
  -- },
  -- {

  --   "nvimdev/dashboard-nvim",
  --   event = "VimEnter",
  --   opts = function()
  --     -- local logo = [[
  --     --      ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
  --     --      ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
  --     --      ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
  --     --      ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
  --     --      ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
  --     --      ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
  --     -- ]]
  --     local logo = [[
  --     ███╗   ███╗██╗  ██╗ ██████╗ ██╗   ██╗██████╗ ██╗     
  --     ████╗ ████║██║ ██╔╝██╔═████╗██║   ██║╚════██╗██║     
  --     ██╔████╔██║█████╔╝ ██║██╔██║██║   ██║ █████╔╝██║     
  --     ██║╚██╔╝██║██╔═██╗ ████╔╝██║╚██╗ ██╔╝ ╚═══██╗██║     
  --     ██║ ╚═╝ ██║██║  ██╗╚██████╔╝ ╚████╔╝ ██████╔╝███████╗
  --     ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═════╝ ╚══════╝
  --     ]]
  --     -- logo = string.rep("\n", 8) .. logo .. "\n\n"
  --     logo = string.rep("\n", 1) .. logo .. "\n\n" .. citation .. "\n\n"
  --     -- logo = logo .. "\n\n" .. citation .. "\n\n"

  --     local opts = {
  --       theme = "doom",
  --       hide = {
  --         -- this is taken care of by lualine
  --         -- enabling this messes up the actual laststatus setting after loading a file
  --         statusline = false,
  --       },
  --       config = {
  --         header = vim.split(logo, "\n"),
  --         -- stylua: ignore
  --         center = {
  --           { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
  --           { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
  --           { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
  --           { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
  --           { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
  --           { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
  --           { action = 'e /home/mkovel/.config/nvim/vimtutor.txt',                        desc = " Vim Tutor", icon = "🎓", key = "t" },
  --           { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
  --           { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
  --           { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
  --         },
  --         footer = function()
  --           local stats = require("lazy").stats()
  --           local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  --           return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
  --         end,
  --       },
  --     }

  --     for _, button in ipairs(opts.config.center) do
  --       button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  --       button.key_format = "  %s"
  --     end

  --     -- close Lazy and re-open when the dashboard is ready
  --     if vim.o.filetype == "lazy" then
  --       vim.cmd.close()
  --       vim.api.nvim_create_autocmd("User", {
  --         pattern = "DashboardLoaded",
  --         callback = function()
  --           require("lazy").show()
  --         end,
  --       })
  --     end

  --     return opts
  --   end,
  -- },
-- }
local a = vim.api

local actions = require "telescope.actions"
local config = require "telescope.config"

local mappings = {}

mappings.default_mappings = config.values.default_mappings
  or {
    i = {
      ["<C-n>"] = actions.move_selection_next,
      ["<Down>"] = actions.move_selection_next,
      ["<C-p>"] = actions.move_selection_previous,
      ["<Up>"] = actions.move_selection_previous,

      ["<C-c>"] = actions.close,
      ["<C-q>"] = actions.close,

      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-]>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-\\>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["<C-o>"] = actions.preview_scrolling_up,
      ["<C-Up>"] = actions.preview_scrolling_up,
      ["<C-u>"] = actions.preview_scrolling_up,
      ["<PageUp>"] = actions.preview_scrolling_up,

      ["<C-l>"] = actions.preview_scrolling_down,
      ["<C-Down>"] = actions.preview_scrolling_down,
      ["<C-d>"] = actions.preview_scrolling_down,
      ["<PageDown>"] = actions.preview_scrolling_down,
      -- ["<C-k>"] = actions.preview_scrolling_right,
      ["<C-Right>"] = actions.preview_scrolling_right,
      ["<Right>"] = actions.preview_scrolling_right,
      ["<C-Left>"] = actions.preview_scrolling_left,
      ["<Left>"] = actions.preview_scrolling_left,
      ["<C-f>"] = actions.preview_scrolling_left,

      -- ["<PageUp>"] = actions.results_scrolling_up,
      -- ["<PageDown>"] = actions.results_scrolling_down,
      -- ["<M-f>"] = actions.results_scrolling_left,
      -- ["<M-k>"] = actions.results_scrolling_right,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      -- ["<C-l>"] = actions.complete_tag,
      ["<C-/>"] = actions.which_key,
      ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      ["<C-w>"] = { "<c-s-w>", type = "command" },

      -- disable c-j because we dont want to allow new lines #2123
      ["<C-j>"] = actions.nop,
    },

    n = {
      ["<esc>"] = actions.close,
      ["<C-q>"] = actions.close,
      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

      -- TODO: This would be weird if we switch the ordering.
      ["l"] = actions.move_selection_next,
      ["o"] = actions.move_selection_previous,
      ["H"] = actions.move_to_top,
      ["M"] = actions.move_to_middle,
      ["L"] = actions.move_to_bottom,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,
      ["gg"] = actions.move_to_top,
      ["G"] = actions.move_to_bottom,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,

      ["<C-o>"] = actions.preview_scrolling_up,
      ["<C-l>"] = actions.preview_scrolling_down,
      ["<C-k>"] = actions.preview_scrolling_left,
      ["Right"] = actions.preview_scrolling_right,
      ["<PageUp>"] = actions.preview_scrolling_up,
      ["<PageDown>"] = actions.preview_scrolling_down,

      ["?"] = actions.which_key,
    },
}
 
---------------------------------------------------------------------------------------------------------
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Quit and save
map("n", "<C-q>", ":q<CR>", { silent = true })
map("n", "<C-s>", ":w<CR>", { silent = true })

-- Mouvement keys
-- Normal mode
-- map("n", "o", "<up>", { silent = true })
map("n", "o", "k", { silent = true })
map("n", "k", "h", { silent = true })
map("n", "l", "j", { silent = false })
map("n", "m", "l", { silent = true })
-- Fast mouvement
map("n", "<C-o>", "5k", { silent = true })
map("n", "<C-k>", "5h", { silent = true })
map("n", "<C-l>", "5j", { silent = true })
map("n", "<C-m>", "5l", { silent = true })

-- Visual mode
map("v", "o", "<up>", { silent = true })
map("v", "k", "h", { silent = true })
map("v", "l", "j", { silent = true })
map("v", "m", "l", { silent = true })
-- Fast mouvement
map("v", "<C-o>", "5k", { silent = true })
map("v", "<C-k>", "5h", { silent = true })
map("v", "<C-l>", "5j", { silent = true })
map("v", "<C-m>", "5l", { silent = true })
-- Motion mode
map("o", "o", "<up>", { silent = false })
map("o", "k", "h", { silent = true })
map("o", "l", "j", { silent = false })
map("o", "m", "l", { silent = true })

map("s", ";", ":", { silent = false })

-- Window keys
map("n", "O", "<C-w>k", { silent = true })
map("n", "L", "<C-w>j", { silent = true })
map("n", "K", "<C-w>h", { silent = true })
map("n", "M", "<C-w>l", { silent = true })
map("n", "<leader>wo", "<C-w>o<CR>", { silent = true, desc = "Close other windows" })

-- Buffer keys
map("n", ",l", ":bp<CR>", { silent = true })
map("n", ",m", ":bn<CR>", { silent = true })

-- Normal mode
map("n", ";", ":", { silent = false })
map("n", "h", "@", { silent = true })
-- map("n", "<C-y>", ":source ~/.config/nvim/lua/config/keymaps.lua<CR>", { silent = false })
map("n", "<C-y>", ":source ~/.config/nvim/init.lua<CR>", { silent = false })
map("n", "<C-a>", ":Commentary<CR>", { silent = true })

map("n", "-", "$", { silent = true })
map("n", "`", ".", { silent = true })
map("n", ".", "%", { silent = true })
map("n", "t", "o", { silent = true })
map("n", "T", "O", { silent = true })
-- map("n", "x", "x", { silent = false })
-- map("n", "x", "i<delete><right><esc>", { silent = false })

-- Terminal
map("n", "<leader>z", ":LazyGit<CR>", { silent = true, desc = "LazyGit" })
map("n", "<leader>cp", ":FloatermNew  python3 %<CR>", { silent = true, desc = "Python run" })
map("n", "<leader>t", ":FloatermNew --height=35 --width=120<CR>", { silent = true, desc = "Terminal" })
map("n", "<C-t>", ":FloatermToggle<CR>", { silent = true, desc = "Terminal" })
map("n", "<leader>r", ":Ranger<CR>", { silent = true, desc = "Ranger" })

-- Visual mode
map("v", ";", ":", { silent = false })
map("v", "<C-a>", ":Commentary<CR>", { silent = true })
map("v", "-", "$", { silent = true })

map("i", "<C-a>", "<Esc>:Commentary<CR>A", { silent = true })

-- map("n", "<C-u>", ":m-2<CR>", { sient = true }
-- map("n", "<Cilent = true })

-- map("x", "<C-u>", ":m-2<CR>gv=gv", { silent = true })
-- map("x", "<C-j>", ":m'>+<CR>gv=gv", { silent = true })

-- map("n", "do", "dk", { silent = true, desc = "which_key_ignore" })
-- map("n", "dl", "dj", { silent = true, desc = "which_key_ignore" })
-- map("n", "dk", "dh", { silent = true, desc = "which_key_ignore" })
-- map("n", "dm", "dl", { silent = true, desc = "which_key_ignore" })
-- map("n", "yo", "yk", { silent = true, desc = "which_key_ignore" })
-- map("n", "yl", "yj", { silent = true, desc = "which_key_ignore" })
-- map("n", "yk", "yh", { silent = true, desc = "which_key_ignore" })
-- map("n", "ym", "yl", { silent = true, desc = "which_key_ignore" })

-- map("n", "<leader>t", "<leader>ft<CR>", { silent = true })
-- map("n", "<leader>cp", ":! python3 % <CR>", { desc = "compile Python", silent = true })
-- map("n", "<leader>cp", "<leader>fT python3 % <CR>", { desc = "compile Python", silent = true })
-- map("n", "<leader>cp", "<leader>ft ls <CR>", { desc = "compile Python", silent = true })

-- map("n", "<leader>wv", ":vs<CR>", { silent = true })
-- map("n", "<leader>w\\", ":vs<CR>", { silent = true })

-- local buf = vim.fn.expand("%")
-- map(
--     "n",
--     "<leader>cp",
--     -- ":FloatermToggle python3 % <CR><Esc><Esc>",
-- ":FloatermToggle TERM=xterm<CR> python3 ./"
--         .. buf
--         -- .. "<CR><Esc><Esc>",
--         .. "<CR>",
-- ":FloatermNew --height=35 --width=120 python3 % <CR><Esc><Esc>",
--     { silent = true, desc = "Python run" }
-- )

map(
    "n",
    ",cl",
    -- "<Esc>:! pdflatex -shell-escape % >/dev/null && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR><CR>",
    -- ":FloatermNew pdfltex -shell-escape % >/dev/null && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR><CR>",
    -- ":FloatermNew pdflatex -shell-escape % >/dev/null && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR>",
    ":FloatermNew pdflatex -shell-escape % 0<&- && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR>",
    { silent = true }
)
-- local conf = require("lualine").get_config()
-- map("n", "<leader>ll", ":" .. conf .. "", { silent = true })
-- map("n", "<leader>h", "i" .. conf .. "", { silent = true })
-- map("n", "<leader>ll", ":" .. conf.options.theme .. "<CR>", { silent = true })

-- function hidenotif()
--     require("notify").dismiss({ silent = true, pending = true })
-- end

---
-------------------------------------------------------------------------------------------------------------------
      -- { "U", vim.lsp.buf.hover, desc = "Hover" },
map("n", "U", vim.lsp.buf.hover, { silent = true, desc = "Hover" })

-- }
--
--
-- local cop = require("copilot")
-- local function SuggestOneCharacter()
--   local suggestion = vim.fn['copilot#Accept']("")
--     local bar = vim.fn['copilot#TextQueuedForInsertion']()
--       return bar:sub(1, 1)
-- end
-- local function SuggestOneWord()
--   require("copilot.suggestion").accept_word()
--   -- local suggestion = vim.fn['copilot#Accept']("")
--     local bar = vim.fn['copilot#TextQueuedForInsertion']()
--       return vim.fn.split(bar,  [[[ .]\zs]])[1]
-- end

-- local sugg = require("copilot.suggestion").accept_word()
-- -- local map = vim.keymap.set

-- -- map('i', '<C-Tab>', require("copilot.suggestion").accept_word(), {expr = true, remap = false})
-- map('i', '<C-l>', SuggestOneWord, {expr = true, remap = false})