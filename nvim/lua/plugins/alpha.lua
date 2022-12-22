local setup, alpha = pcall(require, "alpha")
if not setup then
	return
end

local theme_setup, startify = pcall(require, "alpha.themes.startify")
if not theme_setup then
	return
end

startify.section.mru.val = { { type = "padding", val = 0 } }

alpha.setup(startify.config)
