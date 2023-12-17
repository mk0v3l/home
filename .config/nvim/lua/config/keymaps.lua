-------------------------------------------------------------------------------------------------------------------
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")
-- local M = {}

-- local fn = require("fn")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
-- local map = Util.safe_keymap_set
local map = vim.keymap.set
local togglenum = function()
    -- vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
end
map("n", "<leader>N", togglenum, { desc = "Toggle Line Numbers" })

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
map("n", "<C-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

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
-- map({ "n", "v" }, "<leader>cf", function()
--     Util.format({ force = true })
-- end, { desc = "Format" })

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
-- map("n", "<leader>uf", function() Util.format.toggle() end, { desc = "Toggle auto format (global)" })
-- map("n", "<leader>uF", function() Util.format.toggle(true) end, { desc = "Toggle auto format (buffer)" })
-- map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>uL", function() Util.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
-- map("n", "<leader>ul", function() Util.toggle.number() end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", function() Util.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
-- if vim.lsp.inlay_hint then
  -- map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
-- end
map("n", "<leader>uT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })

-- lazygit
-- map("n", "<leader>gg", function() Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = " Lazygit (root dir)" })
-- map("n", "<leader>gG", function() Util.terminal({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = " Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = " Quit all" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- LazyVim Changelog
-- map("n", "<leader>L", function() Util.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
-- local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end
-- local pythonrun = function() Util.terminal("ls", { cwd = Util.root() }) end
-- map("n", "<leader>fT", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<leader>ft", function() Util.terminal() end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
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
map("n", "<leader>v", "<C-W>v", { desc = "Split window right", remap = true })
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



local actions = require "telescope.actions"
local config = require "telescope.config"

local mappings = {}

mappings.default_mappings = config.values.default_mappings
  or {
    i = {
      ["<C-n>"] = actions.move_selection_next,
      ["<Down>"] = actions.move_selection_next,
      -- ["<C-p>"] = actions.move_selection_previous,
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
      -- ["<C-k>"] = "5k",
      ["<C-Right>"] = actions.preview_scrolling_right,
      ["<Right>"] = actions.preview_scrolling_right,
      ["<C-Left>"] = actions.preview_scrolling_left,
      ["<Left>"] = actions.preview_scrolling_left,
      ["<C-f>"] = actions.preview_scrolling_left,

      -- ["<PageUp>"] = actions.results_scrolling_up,
      -- ["<PageDown>"] = actions.results_scrolling_down,
      -- ["<M-f>"] = actions.results_scrolling_left,
      -- ["<M-k>"] = actions.results_scrolling_right,

      -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
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

      -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
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
      -- ["<C-k>"] = actions.preview_scrolling_left,
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

map("n", "die", "diw", { silent = true })
map("n", "<leader>wo", "<C-w>=", { silent = true })
map("n", "<leader>wi", "<C-w>|", { silent = true })
-- map("n", "z", "w", { silent = true })
-- map("o", "z", "w", { silent = true })
-- map("v", "z", "w", { silent = true })
-- Mouvement keys
-- Normal mode
-- map("n", "o", "<up>", { silent = true })
-- map("n", "o", "k", { silent = true })
-- map("n", "k", "h", { silent = true })
-- map("n", "l", "j", { silent = false })
-- map("n", "m", "l", { silent = true })
-- Fast mouvement
-- map("n", "<C-o>", "5k", { silent = true })
-- map("n", "<C-k>", "5h", { silent = true })
-- map("n", "<C-l>", "5j", { silent = true })
-- map("n", "<C-m>", "5l", { silent = true })
map("n", "<C-k>", "5k", { silent = true })
map("n", "<C-h>", "5h", { silent = true })
map("n", "<C-j>", "5j", { silent = true })
map("n", "<C-l>", "5l", { silent = true })

-- noremap <C-u> :m-2<CR>
-- noremap <C-j> :m+<CR>

-- xnoremap <C-u> :m-2<CR>gv=gv
-- xnoremap <C-j> :m'>+<CR>gv=gv

-- inoremap <C-u> <Esc>: m-2<CR>a
-- inoremap <C-j> <Esc> :m+<CR>i


-- Insert mode
map("i", "jk", "<Esc>", { silent = true })
map("i", "kj", "<Esc>", { silent = true })
map("i", "<C-k>", "<up>", { silent = true ,remap = true})
map("i", "<C-j>", "<down>", { silent = true })
map("i", "<C-h>", "<left>", { silent = true })
map("i", "<C-l>", "<right>", { silent = true })
-- Fast mouvement
-- map("v", "<C-o>", "5k", { silent = true })
-- map("v", "<C-k>", "5h", { silent = true })
-- map("v", "<C-l>", "5j", { silent = true })
-- map("v", "<C-m>", "5l", { silent = true })
-- Visual mode
map("v", "<C-k>", "5k", { silent = true })
map("v", "<C-h>", "5h", { silent = true })
map("v", "<C-j>", "5j", { silent = true })
map("v", "<C-l>", "5l", { silent = true })
-- Motion mode
-- map("o", "o", "<up>", { silent = false })
-- map("o", "k", "h", { silent = true })
-- map("o", "l", "j", { silent = false })
-- map("o", "m", "l", { silent = true })

-- map("i", "<C-o>", "<up>", { silent = false })
-- map("i", "<C-l>", "<down>", { silent = true })
-- map("i", "<C-k>", "<left>", { silent = true })
-- map("i", "<C-m>", "<right>", { silent = true })
map("s", ";", ":", { silent = false })

-- Window keys
map("n", "K", "<C-w>k", { silent = true })
map("n", "J", "<C-w>j", { silent = true })
map("n", "H", "<C-w>h", { silent = true })
map("n", "L", "<C-w>l", { silent = true })
-- map("n", "O", "<C-w>k", { silent = true })
-- map("n", "L", "<C-w>j", { silent = true })
-- map("n", "K", "<C-w>h", { silent = true })
-- map("n", "M", "<C-w>l", { silent = true })
map("n", "<leader>wo", "<C-w>o<CR>", { silent = true, desc = "Close other windows" })

-- Buffer keys
map("n", ",l", ":bp<CR>", { silent = true })
map("n", ",m", ":bn<CR>", { silent = true })

-- Normal mode
map("n", ";", ":", { silent = false })
map("n", "t", "@", { silent = true })
-- map("n", "<C-y>", ":source ~/.config/nvim/lua/config/keymaps.lua<CR>", { silent = false })
map("n", "<C-y>", ":source ~/.config/nvim/init.lua<CR>", { silent = false })
map("n", "<C-a>", ":Commentary<CR>", { silent = true })

map("n", "-", "$", { silent = true })
map("n", "`", ".", { silent = true })
map("n", ".", "%", { silent = true })
-- map("n", "t", "o", { silent = false })
-- map("n", "T", "O", { silent = true })
-- map("n", "x", "x", { silent = false })
-- map("n", "x", "i<delete><right><esc>", { silent = false })

-- Terminal
map("n", "<leader>z", ":LazyGit<CR>", { silent = true, desc = " LazyGit" })
map("n", "<leader>ccp", ":FloatermNew  python3 %<CR>", { silent = false, desc = " Python run" })
-- map("n", "<leader>t", ":FloatermNew --height=35 --width=120<CR>", { silent = true, desc = "Terminal" })
map("n", "<leader>t", ":FloatermNew<CR>", { silent = true, desc = " Terminal" })
map("t", "<C-n>", "<C-\\><C-n> :FloatermNext<CR>", { silent = true, desc = "Terminal" })
map("t", "<C-b>", "<C-\\><C-n> :FloatermPrev<CR>", { silent = true, desc = "Terminal" })
-- map("t", "<C-n>", "<C-\><C-n> :FloatermNext<CR>", { silent = true, desc = "Terminal" })
map("n", "<C-t>", ":FloatermToggle<CR>", { silent = true, desc = " Terminal" })
map("n", "<leader>r", ":Ranger<CR>", { silent = true, desc = " Ranger" })
            --<er>td {action = "FloatermNew  ~/.gord/gord",                                 desc = " DisGord",         icon = "🎮", key = "d" },
map("n", "<leader>D", ":FloatermNew  ~/.gord/gord<CR>", { silent = true, desc = "󰙯 DisGord" })
map("n", "<leader>i", ":FloatermNew  w3m google.com<CR>", { silent = true, desc = "󰖟 Internet Browser" })

-- Visual mode
map("v", ";", ":", { silent = false })
map("v", "<C-a>", ":Commentary<CR>", { silent = true })
map("v", "-", "$", { silent = true })

map("i", "<C-u>", "<bs>", { silent = true })
map("i", "<C-y>", "<C-w>", { silent = true })
map("i", "<C-a>", "<Esc>:Commentary<CR>A", { silent = true })
map("n", "<leader>wh", "<C-w>h", { silent = true , desc = " Window Left" })
map("n", "<leader>wj", "<C-w>j", { silent = true , desc = " Window Down" })
map("n", "<leader>wk", "<C-w>k", { silent = true , desc = " Window Up" })
map("n", "<leader>wl", "<C-w>l", { silent = true , desc = " Window Right" })


-- local copilot_suggestion = fn.require_on_exported_call 'copilot.suggestion'
-- local copilot_panel = fn.require_on_exported_call 'copilot.panel'
-- local copilot_accept_or_insert = function(action, fallback)
--   return function()
--     if copilot_suggestion.is_visible() then
--         copilot_suggestion[action]()
--     elseif fallback then
--         vim.api.nvim_put(vim.split(fallback, '\n'), 'c', false, true)
--     end
--   end
-- end

-- m.inoremap({ xk [[<C-\>]], [[]] }, copilot_accept_or_insert('accept', '\n'), m.silent, 'Copilot: Accept')
-- m.inoremap([[<M-\>]], copilot_accept_or_insert 'accept_word', m.silent, 'Copilot: Accept Word')
-- m.inoremap(xk [[<M-S-\>]], copilot_accept_or_insert('accept_line', '\n'), m.silent, 'Copilot: Accept Line')])])]]})
-- map("i", "xk [[<C-\\>]]", copilot_accept_or_insert('accept', '\n'),{ silent = true, desc = "Coppilot Accept Line" })
-- map("i", "xk [[<C-l>]]", copilot_accept_or_insert('accept', '\n'),{ silent = true, desc = "Coppilot Accept Line" })
-- map("i", "[[<C-l>]]", copilot_accept_or_insert('accept', '\n'),{ silent = true, desc = "Coppilot Accept Line" })
-- map("i", "<C-l>", copilot_accept_or_insert('accept', '\n'),{ silent = true, desc = "Coppilot Accept Line" })
--
--
--
  -- { xk [[<C-\>]], [[]] }, copilot_accept_or_insert('accept', '\n'), m.silent, 'Copilot: Accept')
-- m.inoremap([[<M-\>]], copilot_accept_or_insert 'accept_word', m.silent, 'Copilot: Accept Word')
-- m.inoremap(xk [[<M-S-\>]], copilot_accept_or_insert('accept_line', '\n'), m.silent, 'Copilot: Accept Line')])])]]})

-- map("n", "<C-i>", "<Esc>:Copilot panel<CR>", { silent = true, desc = "Coppilot Panel" })
-- map("i", "<C-i>", "<Esc>:Copilot panel<CR>", { silent = true, desc = "Coppilot Panel" })
-- map("i", "<C-i>", "<up>", { silent = true, desc = "Coppilot Panel" })
-- map("n", "<leader>F", "<cmd>!~/.keyrepeatfast.sh<CR>", { silent = true, desc = "󰖟 Key Repeat Fast" })
map("n", "<leader>1", "<cmd>!~/.keyrepeat.sh;cat ~/.speed<CR>", { silent = true, desc = "󰖟 Key Repeat Fast" })
-- map("n", "<leader>S", "<cmd>!~/.keyrepeatslow.sh<CR>", { silent = true, desc = "󰖟 Key Repeat Slow" })
-- map("i", "<C-down>", "<cmd>:Copilot suggestion accept_line<CR>", { silent = true, desc = "Coppilot Accept Line" })
-- map("i", "<C-o>", "<cmd>:Copilot suggestion accept_word<CR>", { silent = true, desc = "Coppilot Accept Word" })
-- map("i", "<C-right>", "<cmd>Copilot suggestion accept_word<CR>", { silent = true, desc = "Coppilot Accept Word" })
-- vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', {})
-- local map = vim.keymap.set
-- vim.keymap.del("n", "<leader>cl")
-- vim.keymap.set("mode", "the keymap", "<nop>", {}) {} is the opt table
-- vim.keymap.set("n", "<leader>cl",  "<nop>", {})
-- map("n", "<leader>cl", "<cmd>LspInfo<cr>", { silent = true, desc = "Lsp Info" })
map("n", "<leader>ccl", ":FloatermNew pdflatex -shell-escape % 0<&- && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR>", { silent = false, desc = "   LaTeX" })
map("n", "<leader>ccu", ":luafile %<CR>", { silent = false, desc = "  Lua" })
map("n", "<leader>k", "<cmd>lua require'visualkeyboard'.toggle()<CR>", { silent = false, desc = " Toggle Keyboard"})
map("n", "<leader>ccm", ":FloatermNew make<CR>", { silent = false, desc = "  Make" })
map("n", "<leader>ccM", ":FloatermNew cat % | pandoc -f markdown -t pdf | zathura - --mode fullscreen 2>/dev/null <cr>", { silent = false, desc = "   Markdown" })
-- <CR>", { silent = true, desc = "  LaTeX Compile" })
-- map("n", "<leader>k", ":FloatermNew make<CR>", { silent = false, desc = "  Make" })
-- 󰞦 cat README.md| pandoc -t pdf | zathura - --mode fullscreen
-- map(
--     "n",
--     ",cl",
--     -- "<Esc>:! pdflatex -shell-escape % >/dev/null && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR><CR>",
--     -- ":FloatermNew pdfltex -shell-escape % >/dev/null && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR><CR>",
--     -- ":FloatermNew pdflatex -shell-escape % >/dev/null && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR>",
--     ":FloatermNew pdflatex -shell-escape % 0<&- && zathura --mode fullscreen %:r.pdf 2>/dev/null<CR>",
--     { silent = true }
-- )
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

-- local function SuggestOneCharacter()
--   local suggestion = vim.fn['copilot#Accept']("")
--   local bar = vim.fn['copilot#TextQueuedForInsertion']()
--   return bar:sub(1, 1)
-- end
-- local function SuggestOneWord()
--   local suggestion = vim.fn['copilot#Accept']("")
--   local bar = vim.fn['copilot#TextQueuedForInsertion']()
--   return vim.fn.split(bar,  [[[ .]\zs]])[1]
-- end

-- local map = vim.keymap.set

-- }
--
--

-- -- local copilot_suggestion = fn.require_on_exported_call 'copilot.suggestion'
-- local copilot_panel = fn.require_on_exported_call 'copilot.panel'
-- local copilot_accept_or_insert = function(action, fallback)
--   return function()
--     if copilot_suggestion.is_visible() then
--         copilot_suggestion[action]()
--     elseif fallback then
--         vim.api.nvim_put(vim.split(fallback, '\n'), 'c', false, true)
--     end
--   end
-- end

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
-- map('i', '<C-l>', SuggestOneCharacter, {expr = true, remap = false})
-- map('i', '<C-o>', SuggestOneWord, {expr = true, remap = false})
-- -- local sugg = require("copilot.suggestion").accept_word()
-- -- local map = vim.keymap.set

-- -- require("copilot.suggestion").accept_word()
-- -- -- map('i', '<C-Tab>', require("copilot.suggestion").accept_word(), {expr = true, remap = false})
-- -- map('i', '<C-l>', SuggestOneWord, {expr = true, remap = false})
