-- auto insert closing brackets, etc.
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "vim" },
      })
    end,
  },
}
