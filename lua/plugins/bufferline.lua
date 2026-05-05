-- show open buffers
return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        always_show_bufferline = true,
      },
      highlights = {
        buffer_selected = { italic = false },
        buffer_visible = { italic = false },
        modified_selected = { italic = false },
        modified_visible = { italic = false },
      },
    },
    keys = {
      { "<leader>x", "<cmd>bd<cr>", desc = "Close Buffer" },
      {
        "<leader>bd",
        "<cmd>BufferLineCloseOthers<cr>",
        desc = "Close all buffers except current",
      },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
      {
        "<leader>1",
        function()
          require("bufferline").go_to_buffer(1, true)
        end,
        desc = "Go to Buffer 1",
      },
      {
        "<leader>2",
        function()
          require("bufferline").go_to_buffer(2, true)
        end,
        desc = "Go to Buffer 2",
      },
      {
        "<leader>3",
        function()
          require("bufferline").go_to_buffer(3, true)
        end,
        desc = "Go to Buffer 3",
      },
      {
        "<leader>4",
        function()
          require("bufferline").go_to_buffer(4, true)
        end,
        desc = "Go to Buffer 4",
      },
      {
        "<leader>5",
        function()
          require("bufferline").go_to_buffer(5, true)
        end,
        desc = "Go to Buffer 5",
      },
      {
        "<leader>6",
        function()
          require("bufferline").go_to_buffer(6, true)
        end,
        desc = "Go to Buffer 6",
      },
      {
        "<leader>7",
        function()
          require("bufferline").go_to_buffer(7, true)
        end,
        desc = "Go to Buffer 7",
      },
      {
        "<leader>8",
        function()
          require("bufferline").go_to_buffer(8, true)
        end,
        desc = "Go to Buffer 8",
      },
      {
        "<leader>9",
        function()
          require("bufferline").go_to_buffer(9, true)
        end,
        desc = "Go to Buffer 9",
      },
    },
  },
}
