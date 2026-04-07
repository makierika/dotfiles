return {
  'goolord/alpha-nvim',
  config = function ()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    dashboard.section.buttons.val = {
      dashboard.button("󱁐e", "  New file" , ":ene<CR>"),
      dashboard.button("󱁐ff", "󰈞  Find file"),
      dashboard.button("󱁐fi", "󰅳  Find input"),
      dashboard.button("󱁐fc", "󰈬  Find cursor"),
      dashboard.button("󱁐q", "󰅚  Quit nvim"),
    }
    alpha.setup(dashboard.config)
  end,
}
