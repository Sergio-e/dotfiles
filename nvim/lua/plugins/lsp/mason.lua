local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "ruby_ls", -- Ruby
    "tsserver", -- JavaScript
    "rust_analyzer",
    "html",
    "cssls",
    "tailwindcss",
    "sumneko_lua",
    "marksman" -- Markdown
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})
