return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		events = { "BufReadPost", "BufWritePost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			servers = {
				lua_ls = {},
				clangd = {},
				rust_analyzer = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")

			local on_attach = function(_, bufnr)
				-- stylua: ignore start
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc="Goto Definition", silent = true, buffer = bufnr })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "References", silent = true, buffer = bufnr })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto Declaration", silent = true, buffer = bufnr, nowait = true })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", silent = true, buffer = bufnr })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation", silent = true, buffer = bufnr })
				vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help", silent = true, buffer = bufnr })
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", silent = true, buffer = bufnr })
				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename", silent = true, buffer = bufnr })
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", silent = true, buffer = bufnr })
				vim.keymap.set({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens", silent = true, buffer = bufnr })
				vim.keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens", silent = true, buffer = bufnr })
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder", silent = true, buffer = bufnr })
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder", silent = true, buffer = bufnr })
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type definition", silent = true, buffer = bufnr })
				vim.keymap.set("n", "so", require("telescope.builtin").lsp_references, { desc = "LSP references", silent = true, buffer = bufnr })
				-- stylua: ignore end
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for server, server_opts in pairs(opts.servers) do
				local server_opts_with_capabilities = vim.tbl_deep_extend("force", {
					on_attach = on_attach,
					capabilities = vim.deepcopy(capabilities),
				}, server_opts)
				lspconfig[server].setup(server_opts_with_capabilities)
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clang-format",
				"clangd",
				"lua_ls",
				"ruff",
				"selene",
				"stylua",
				"shfmt",
				"rust-analyzer",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"lua_ls",
				"ruff",
			},
		},
	},
}
