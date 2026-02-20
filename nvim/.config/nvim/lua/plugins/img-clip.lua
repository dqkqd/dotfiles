return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = function()
        local found = vim.fs.find("assets", {
          upward = false,
          type = "directory",
        })[1]
        if found then
          return found
        end
        return "assets"
      end,
    },
  },
}
