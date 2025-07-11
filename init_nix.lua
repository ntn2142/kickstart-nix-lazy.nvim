-- planning space for the nix derivation entry point of the config

-- TODO:
-- load setting
-- setup lazy for nix

require('settings')

-- TODO: for further configuration of lazy a file for common configuration should be placed in lua/
-- TODO: load lazy config and make changes required for nix
require('lazy').setup {
  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
    },
  },
  dev = {
    path = '${pkgs.vimUtils.packDir config.home-manager.users.USERNAME.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start',
  },
  install = {
    -- Safeguard in case we forget to install a plugin with Nix
    missing = false,
  },
  spec = {
    -- Import plugins from lua/plugins
    { import = 'plugins' },
    { import = 'languages' },
  },
  change_detection = { enabled = false, notify = false },
}
