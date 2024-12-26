return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    }
  }
}
