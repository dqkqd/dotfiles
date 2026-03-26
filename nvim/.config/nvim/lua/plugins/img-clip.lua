return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    custom = {
      {
        trigger = function() -- returns true to enable
          local cwd = vim.fn.getcwd()
          local foldername = vim.fn.fnamemodify(cwd, ":t")
          return foldername == "blog"
        end,
        template = [[
<CenteredImage
  name="$FILE_NAME"
  alt="$CURSOR"
/>]],
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
        file_name = function()
          local name = vim.fn.expand("%:t:r") -- current file without extension
          local timestamp = os.date("%Y%m%d%H%M%S")
          return name .. "_" .. timestamp
        end,
      },
    },
  },
}
