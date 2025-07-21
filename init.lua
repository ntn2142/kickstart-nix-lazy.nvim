-- config entry for Windows and non nix linux and macos

-- NOTE:
-- you as a user should not change the contents of this file
-- otherwise behavior might be different between nix and other installations

-- TODO:
-- load general settings
-- install lazy.nvim
-- setup lazy

-- NOTE: make sure to set leader and local leader here
require('settings')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- TODO: load lazy config from lua/
require('lazy').setup(require('lazyconfig'))
