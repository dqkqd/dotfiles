-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- formatting
keymap.set({ "n", "v" }, "<leader>fm", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

local bufferline = require("bufferline")
-- stylua: ignore start
keymap.set("n", "<leader>1", function() bufferline.go_to(1) end, { desc = "Goto Buffer 1", silent = true })
keymap.set("n", "<leader>2", function() bufferline.go_to(2) end, { desc = "Goto Buffer 2", silent = true })
keymap.set("n", "<leader>3", function() bufferline.go_to(3) end, { desc = "Goto Buffer 3", silent = true })
keymap.set("n", "<leader>4", function() bufferline.go_to(4) end, { desc = "Goto Buffer 4", silent = true })
keymap.set("n", "<leader>5", function() bufferline.go_to(5) end, { desc = "Goto Buffer 5", silent = true })
keymap.set("n", "<leader>6", function() bufferline.go_to(6) end, { desc = "Goto Buffer 6", silent = true })
keymap.set("n", "<leader>7", function() bufferline.go_to(7) end, { desc = "Goto Buffer 7", silent = true })
keymap.set("n", "<leader>8", function() bufferline.go_to(8) end, { desc = "Goto Buffer 8", silent = true })
keymap.set("n", "<leader>9", function() bufferline.go_to(9) end, { desc = "Goto Buffer 9", silent = true })
keymap.set("n", "<leader>0", function() bufferline.go_to(0) end, { desc = "Goto Buffer -1", silent = true })
keymap.set("n", "<leader>bl", function() bufferline.close_in_direction("right") end, {desc = "Delete buffer in the right", silent = true})
keymap.set("n", "<leader>bh", function() bufferline.close_in_direction("left") end, {desc = "Delete buffer in the right", silent = true})
-- stylua: ignore end

local neogit = require("neogit")
-- stylua: ignore start
keymap.set("n", "<leader>mg", function() neogit.open({ kind = "auto"}) end, { desc = "Open Neogit", silent= true })
-- stylua: ignore end

keymap.set({ "n" }, "<C-k>", "<cmd>m-2<cr>", { desc = "Move line up", silent = true })
keymap.set({ "n" }, "<C-j>", "<cmd>m+1<cr>", { desc = "Move line down", silent = true })
-- not sure <cmd> doesn't work in this case
keymap.set({ "v", "x" }, "<C-k>", ":'<,'>m-2<cr>gv=gv", { desc = "Move lines up", silent = true })
keymap.set({ "v", "x" }, "<C-j>", ":'<,'>m'>+1<cr>gv=gv", { desc = "Move lines down", silent = true })
