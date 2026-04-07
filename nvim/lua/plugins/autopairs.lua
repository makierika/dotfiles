return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = { 'TelescopePrompt' , 'vim' },
    })
  end,
}
