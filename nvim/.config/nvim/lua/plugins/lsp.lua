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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for server, server_opts in pairs(opts.servers) do
				local server_opts_with_capabilities = vim.tbl_deep_extend("force", {
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
