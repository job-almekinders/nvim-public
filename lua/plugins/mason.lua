-- install external dependencies
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LSPs
          "bash-language-server",
          "bicep-lsp",
          "docker-language-server",
          "lua-language-server",
          "pyright",
          "rust-analyzer",
          "terraform-ls",
          "yaml-language-server",
          -- DAP
          "codelldb",
          -- Formatters / linters
          "hadolint",
          "markdownlint",
          "mypy",
          "prettier",
          "ruff",
          "shfmt",
          "stylua",
          "tflint",
          "yamllint",
          -- Extras
          "tree-sitter-cli",
        },
        auto_update = false,
        run_on_start = true,
        start_delay = 3000, -- Delay in ms to keep startup snappy
      })
    end,
  },
}
