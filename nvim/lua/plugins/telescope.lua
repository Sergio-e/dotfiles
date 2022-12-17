local telescope_setup, telescope = pcall(require, "telescope")
if not setup then
  return
end

local actions_setup, telescope = pcall(require, "telescope.actions")
if not setup then
  return
end

telescope.setup()

telescope.load_extension("fzf")
