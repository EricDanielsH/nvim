return {
  -- add gruvbox
  {
    "catppuccin/nvim",
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    priority = 1000, -- Ensure it loads first
    lazy = false,
    opts = {
      no_italic = false,
      term_colors = true,
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      transparent_background = true, -- disables setting the background color.
      styles = {
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      highlight_overrides = {
        mocha = function(mocha)
          return {
            NvimTreeNormal = { bg = mocha.none },
          }
        end,
      },
      color_overrides = {
        mocha = {
          rosewater = "#efc9c2",
          flamingo = "#ebb2b2",
          pink = "#f2a7de",
          mauve = "#b889f4",
          red = "#ea7183",
          maroon = "#ea838c",
          peach = "#f39967",
          yellow = "#eaca89",
          green = "#96d382",
          teal = "#78cec1",
          sky = "#91d7e3",
          sapphire = "#68bae0",
          blue = "#739df2",
          lavender = "#a0a8f6",
          text = "#b5c1f1",
          subtext1 = "#a6b0d8",
          subtext0 = "#959ec2",
          overlay2 = "#848cad",
          overlay1 = "#717997",
          overlay0 = "#63677f",
          surface2 = "#505469",
          surface1 = "#3e4255",
          surface0 = "#2c2f40",
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
          -- base = "#1a1c2a",
          -- mantle = "#141620",
          -- crust = "#0e0f16",
        },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        -- nvim transparent background
        nvimtree = {
          enabled = true,
          show_root = true, -- makes the root folder not transparent
          transparent_panel = false, -- make the panel transparent
        },
        treesitter = true,
        telescope = {
          enabled = true,
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
