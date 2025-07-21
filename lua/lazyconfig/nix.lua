return function(packpath)
    local base_config = require('lazyconfig.base')
    local nix_config = {
        performance = {
            reset_packpath = false,
            rtp = {
                reset = false,
            },
        },
        dev = {
            path = packpath,
            patterns = { '' },
        },
        install = {
            -- Safeguard in case we forget to install a plugin with Nix
            missing = false,
        },
    }
    return vim.tbl_deep_extend('force', base_config, nix_config)
end
