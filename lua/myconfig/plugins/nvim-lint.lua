require('lint').linters_by_ft = {
  -- C and C++ linters
  c = {'clang'},
  cpp = {'clang'},
  
  -- Rust linter (using rust-analyzer or any other Rust linter)
  rust = {'rustfmt'}, -- Rustfmt can handle basic linting and formatting
}

-- Enable linting on save
vim.cmd('autocmd BufWritePost * lua require("lint").try_lint()')
