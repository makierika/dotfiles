return {
  'nvim-mini/mini.completion',
  version = '*',
  config = function()
    require('mini.completion').setup({
      lsp_completion = {
        source_func = 'completefunc',
        auto_setup = true
      }
    })
  end,
}
