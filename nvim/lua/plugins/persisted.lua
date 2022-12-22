local setup, persisted = pcall(require, "persisted")
if not setup then
	return
end

local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

persisted.setup({
	use_git_branch = true,
	autosave = false,
})

telescope.load_extension("persisted")
