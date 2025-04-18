return {
  "folke/snacks.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    picker = {
      hidden = true, -- show hidden files
      ignored = true, -- show ignored files
      enabled = true,
      sources = {
        files = {
          hidden = true, -- show hidden files
          ignored = true, -- show ignored files
        },
      },
      layout = {
        layout = {
          backdrop = true,
        },
      },
    },
  },
}
