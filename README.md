# Neovim template

This is a bad idea for learning neovim API's and learning how *you* like things set up, but it's good for a taste of neovim as a main editor.

This will include:

- Basic plugins
- Additional motions
- File tree
- Plugin manager

## Steps

- Install neovim (probably best to just do `brew install neoivm`)
- Install packer: To get plugins, you need to install Packer.nvim, the plugin packaging tool.
  - Navigate to [Packer.nvim](https://github.com/wbthomason/packer.nvim)
  - Run the steup comand (spoiler, it's `git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`)
- Clone this directory in to your dotfiles. The important part is that the `nvim` directory *needs to be in your home directories .config dir*. Also, you may probably already have one. So don't nuke it, just copy `nvim` to `~/.config/nvim`.
  - Alternatively, do `mkdir ~/.config && cd ~/.config && git clone git@github.com:natdm/neovimtemplate.git .`.
  - This repo isn't meant to be updated locally, so just clone it and wherever it's cloned to, move `.config/nvim` to *your local `~/.config` directory, so that `~/.config/nvim/init.lua` exists. Without that, this isn't picked up. 
- Open neovim with `nvim` and run `:PackerInstall` and follow the prompts.
  - Entering `:` gets you to Command mode, then you run a command. Here, PackerInstall installs all the plugins located in the plugins directory.
- From there on out, just peruse the code and add stuff if you need to. Read about packer from the Packer repository, and do some research on lua. Lua is about as easy as it gets to learn. Especially if you have a history in Javascript.

## Repo structure:

- `nvim` -- the folder that should be under `~/.config/`, for any neovim settings
- |- `init.lua` -- neovim looks for either an init lua or vim file. We're going lua, since it's the better choice for fresh setups
- |- `lua/` - the rest of the lua stuff goes in here, and from here on out, it's opinionated and how I prefer to organize it.
- |- `lua/maps.lua` -- any key mappings should go here. There's some helper functions with files in there. Read it.
- |- `lua/settings.lua` -- neovim global settings. I've put in my defaults, just run `:h <setting>` in neovim to read about it. Or google.
- |- `lua/plugins/` -- all plugin settings are located here.
- |- `lua/plugins/init.lua` -- any `init.lua` is like `index.js`, if it exists. This is the entrypoint to the `plugins` folder and installs all the plugins.
- |- `lua/plugins/configs/` -- any addon that needs complex settings, I usually put a lua file in here, name it after the plugin, and `require` it when installing it.

*SUPER IMPORTANT CAVEAT* If you are  installing a plugin that needs a config, first install the plugin, and then config file, then configure the plugin. If you set up a plugin to read from a config file and it's not there, neovim does not start. So, create the empty config file first, then require the plugin. Example:

I want to install [Prettier](https://github.com/MunifTanjim/prettier.nvim) for JS formatting, so I will..
- See if it requires a configuration by reading the docs. I have determined it does, for my needs, so I will make a `./nvim/lua/plugins/configs/prettier.lua` file.
- Add the plugin to `./nvim/lua/plugins.init.lua` the same way the docs suggest
- add `config = require("plugins.configs.prettier")` to the `use` statement for prettier in the `plugins/init.lua` file.

Now it will look for a file that exists and not panic.
