-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  { 'vyfor/cord.nvim' },
  {
    'f-person/auto-dark-mode.nvim',

    opts = {
      update_interval = 1000,

      fallback = 'light',

      set_dark_mode = function()
        vim.o.background = 'dark'

        require('colors.ziggy').load()
      end,

      set_light_mode = function()
        vim.o.background = 'light'

        require('colors.ziggy').load()
      end,
    },
  },
}
