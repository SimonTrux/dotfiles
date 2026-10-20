local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  -- then move to the commit in lazy-lock.json, so a fresh install matches the lockfile
  local ok, lock = pcall(function()
    return vim.json.decode(table.concat(vim.fn.readfile(vim.fn.stdpath("config") .. "/lazy-lock.json"), "\n"))
  end)
  if ok and lock["lazy.nvim"] then
    vim.fn.system({ "git", "-C", lazypath, "checkout", "--quiet", lock["lazy.nvim"].commit })
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "josean.plugins" }, { import = "josean.plugins.lsp" } }, {
-- require("lazy").setup({ { import = "josean.plugins" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
