vim.lsp.config['clang'] = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
  root_markers = {
    '.git',
    'CMakeLists.txt'
  }
}
