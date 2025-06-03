-- set style for material theme
vim.g.material_style = "deep ocean"

return {
  {
    "marko-cerovac/material.nvim",
    opts = {},
  },

  -- Configure LazyVim to Load Material
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
}
