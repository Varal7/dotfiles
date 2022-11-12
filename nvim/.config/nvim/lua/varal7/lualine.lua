local colors = {
  deep_space = '#100E23',
  space = '#1e1c31',
  eclipse = '#3E3859',

  red = '#F48FB1',
  dark_red = '#ff5458',

  green = '#A1EFD3',
  dark_green = '#62d196',

  yellow = '#ffe9aa',
  dark_yellow = '#ffb378',

  blue = '#91ddff',
  dark_blue = '#66b2ff',

  purple = '#c991e1',
  dark_purple = '#906cff',

  cyan = '#aaffe4',
  dark_cyan = '#63f2f1',

  clouds = '#cbe3e7',
  dark_clouds = '#6B697E',
}

local embark = {
  visual = {
    a = {fg = colors.deep_space, bg = colors.dark_cyan, 'bold'},
    b = {fg = colors.dark_cyan, bg = colors.deep_space}
  },
  replace = {
    a = {fg = colors.deep_space, bg = colors.red, 'bold'},
    b = {fg = colors.red, bg = colors.deep_space}
  },
  inactive = {
    c = {fg = colors.dark_clouds, bg = colors.deep_space},
    a = {fg = colors.dark_clouds, bg = colors.deep_space, 'bold'},
    b = {fg = colors.dark_clouds, bg = colors.deep_space}
  },
  normal = {
    c = {fg = colors.dark_clouds, bg = colors.deep_space},
    a = {fg = colors.deep_space, bg = colors.cyan, 'bold'}, 
    b = {fg = colors.clouds, bg = colors.deep_space},
  },
  insert = {
    a = {fg = colors.deep_space, bg = colors.yellow, 'bold'},
    b = {fg = colors.yellow, bg = colors.deep_space}
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = embark,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics' },
    lualine_c = {'filename'},
    lualine_x = {'g:coc_status', 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
