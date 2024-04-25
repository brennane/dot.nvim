# Common

- WezTerm from Terminal.app for proper color extensions
- NVCHAD <https://nvchad.com/> provides a useful neovim common setup
- I am using a patched Menlo _font_ 'MesloLGM Nerd Font' from Nerd Font <https://www.nerdfonts.com>

## WezTerm configuration sample

~~~lua
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- https://wezfurlong.org/wezterm/colorschemes/e/index.html
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Earthsong'
-- config.font = wezterm.font 'JetBrains Mono'
config.font = wezterm.font 'MesloLGM Nerd Font'
~~~

-- and finally, return the configuration to wezterm
return config

# Markdown

Reference here <https://github.com/iamcco/markdown-preview.nvim>

NVCHAD uses Lazy so we install the config snippet to `plugins/init.lua`

~~~lua
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
}
~~~

# Rust

YouTube video on setting up neovim with rust: <https://www.youtube.com/watch?v=mh_EJhH49Ms>

- Uses NVCHAD (I have a basic configuration started)

Part II talks about deeper integration and for this look to <https://github.com/mrcjkb/rustaceanvim>
which is not archived.  (At this point this may be more than I want for Rust)


- lua/configs/lspconfig.lua (rust-analyzer config)
- lua/plugins/init.lua (enabled mason, rust-analyzer, rust-lang/rust.vim)

# Rust
