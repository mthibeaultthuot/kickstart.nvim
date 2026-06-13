-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  { 'vyfor/cord.nvim' },
  { "rose-pine/neovim", name = "rose-pine" },
  { "neanias/everforest-nvim", },
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    opts = {
      extra_groups = {
        'NormalFloat',
        'FloatBorder',
        'FloatTitle',
        'NormalNC',
        'SignColumn',
        'FoldColumn',
        'LineNr',
        'CursorLineNr',
        'StatusLine',
        'StatusLineNC',
        'TabLine',
        'TabLineFill',
        'WinBar',
        'WinBarNC',
        'WinSeparator',
        'NeoTreeNormal',
        'NeoTreeNormalNC',
        'NeoTreeEndOfBuffer',
        'TelescopeNormal',
        'TelescopeBorder',
        'TelescopePromptNormal',
        'TelescopePromptBorder',
        'TelescopeResultsNormal',
        'TelescopeResultsBorder',
        'TelescopePreviewNormal',
        'TelescopePreviewBorder',
        'LazyNormal',
        'MasonNormal',
      },
      exclude_groups = {
        'CursorLine',
        'Visual',
        'Search',
        'IncSearch',
        'Pmenu',
        'PmenuSel',
      },
    },
  },
  {
    'f-person/auto-dark-mode.nvim',

    opts = {
      update_interval = 1000,

      fallback = 'light',

      set_dark_mode = function()
        vim.o.background = 'dark'
        vim.cmd.colorscheme 'ziggy_dark'
        vim.cmd.TransparentEnable()
      end,

      set_light_mode = function()
        vim.o.background = 'light'
        vim.cmd.colorscheme 'ziggy_light'
        vim.cmd.TransparentEnable()
      end,
    },
  },
}
