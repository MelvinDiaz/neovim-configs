local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescriptreact = {
      require("formatter.filetypes.javascript").prettier
    },
    javascriptreact = {
      require("formatter.filetypes.javascript").prettier
    },
    cpp = {
      function()
        return {
          exe = "clang-format",
          stdin = true,
        }
      end
    },
    hpp = {
      function()
        return {
          exe = "clang-format",
          stdin = true
        }
      end
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }

  }
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  command = "FormatWriteLock"
})

return M
