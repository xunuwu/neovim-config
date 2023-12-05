vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n><C-w>")

vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Info" })

vim.keymap.set("n", "<leader>ol", "<cmd>Lazy<cr>", { desc = "Lazy" })
