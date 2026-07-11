return {
  -- {
  --   "catppuccin/nvim",
  --   opts = {
  --     styles = {
  --       conditionals = {},
  --       miscs = {},
  --     },
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  -- { "sainnhe/gruvbox-material" },
  -- { "sainnhe/everforest" },
  -- { "ellisonleao/gruvbox.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      styles = {
        keywords = { italic = false },
      },
    },
  },
  -- { "edeneast/nightfox.nvim" },
  -- {
  --   "webhooked/kanso.nvim",
  --   opts = {
  --     keywordStyle = { italic = false },
  --   },
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  -- },
}
