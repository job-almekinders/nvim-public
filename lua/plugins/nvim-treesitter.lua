-- analyze files to make linking and highlighting possible (and more)
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  branch = "main",
  config = function()
    local parsers = {
      "bash",
      "diff",
      "dockerfile",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "python",
      "regex",
      "css",
      "javascript",
      "hcl",
      "terraform",
    }
    require("nvim-treesitter").install(parsers)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        -- check if parser exists and load it
        if not vim.treesitter.language.add(language) then
          return
        end
        -- enables syntax highlighting and other treesitter features
        vim.treesitter.start(buf, language)

        -- enables treesitter based folds
        -- for more info on folds see `:help folds`
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'

        -- enables treesitter based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
