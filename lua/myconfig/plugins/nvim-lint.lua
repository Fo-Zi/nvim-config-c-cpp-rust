local lint = require('lint')

-- Configure clang linter
lint.linters.clang = {
  cmd = 'clang',  -- You can specify the full path if clang is not in your PATH
  args = { '-fsyntax-only', '--', '%' },
}

-- Map filetypes to the linter
lint.linters_by_ft = {
  c = { 'clang-tidy' },
  cpp = { 'clang-tidy' },
  rust = { 'rustfmt' },  -- For Rust files
}

-- Enable linting on save
vim.cmd('autocmd BufWritePost * lua require("lint").try_lint()')
