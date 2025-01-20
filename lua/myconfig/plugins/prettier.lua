local null_ls = require('null-ls')

local M = {}

M.setup = function()
  null_ls.setup({
    sources = {
      -- Format C and C++ files with clang-format
      null_ls.builtins.formatting.clang_format.with({
        filetypes = { "c", "cpp" },
      }),

      -- Format Rust files with rustfmt
      null_ls.builtins.formatting.rustfmt.with({
        filetypes = { "rust" },
      }),

      -- Format JavaScript, TypeScript, and other filetypes with prettier
      null_ls.builtins.formatting.prettier.with({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "html", "json" },
      }),
    },
  })

end

return M

