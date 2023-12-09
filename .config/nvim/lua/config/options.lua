-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.wo.number = true
vim.wo.relativenumber = true

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = "*", command = "! ~/.keyrepeatfast.sh >/dev/null" })
-- vim.api.nvim_create_autocmd({ "VimLeavePre" }, { pattern = "*", command = "! ~/.keyrepeatslow.sh >/dev/null" })
-- autocmd ModeChanged *:[vV\x16]* :echom 'VisualEnter'
-- vim.api.nvim_create_autocmd({ "ModeChanged" }, { pattern = "*:[vV\x16]*", command = "set norelativenumber" })
--
-- vim.api.nvim_create_autocmd({ "ModeChanged" }, { pattern = "v:*", command = "RltvNmbr" })
-- map("n", "<leader>F", "<cmd>!~/.keyrepeatfast.sh<CR>", { silent = true, desc = "󰖟 Key Repeat Fast" })
-- map("n", "<leader>S", "<cmd>!~/.keyrepeatslow.sh<CR>", { silent = true, desc = "󰖟 Key Repeat Slow" })
-- vim.api.nvim_create_autocmd({ "ModeChanged" }, { pattern = "*:i", command = "! ~/.keyrepeatslow.sh" })
-- vim.api.nvim_create_autocmd({ "ModeChanged" }, { pattern = "*:i", command = "<leader>S" })
-- vim.api.nvim_create_autocmd({ "ModeChanged" }, { pattern = "*:v", command = "RltvNmbr" })
-- vim.api.nvim_create_autocmd({ "ModeChanged" }, { pattern = "i:*", command = "! ~/.keyrepeatfast.sh" })
-- vim.api.nvim_create_autocmd({ "ModeChanged" }, { pattern = "i:*", command = "<leader>F" })

-- :au ModeChanged [vV\x16]*:* let &l:rnu = mode() =~# '^[vV\x16]'
-- :au ModeChanged *:[vV\x16]* let &l:rnu = mode() =~# '^[vV\x16]'
-- :au WinEnter,WinLeave * let &l:rnu = mode() =~# '^[vV\x16]'

-- vim.api.nvim_create_autocmd('ModeChanged', {
--   callback = function()
--     local old_mode = vim.v.event.old_mode
--     local new_mode = vim.v.event.new_mode
--   end
-- })
-- local cmp = require("copilot-cmp")
-- cmp.event:on("menu_opened", function()
--     vim.b.copilot_suggestion_hidden = true
-- end)

-- cmp.event:on("menu_closed", function()
--     vim.b.copilot_suggestion_hidden = false
-- end)

-- local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
-- local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
