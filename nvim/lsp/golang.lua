vim.lsp.config['golang'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod' },
  root_markers = {
    '.git',
    'go.mod'
  }
}
