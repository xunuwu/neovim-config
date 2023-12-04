vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n><C-w>")

vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)
