-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to Tab 1" })
keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to Tab 2" })
keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to Tab 3" })
keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to Tab 4" })
keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to Tab 5" })
keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Go to Tab 6" })
keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Go to Tab 7" })
keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Go to Tab 8" })
keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Go to Tab 9" })
keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete buffers to the Left" })
keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete buffers to the Right" })

keymap.set("n", "<leader>cp", function() vim.fn.setreg("+", vim.fn.expand("%:.")) end, { desc = "Copy file path" })
