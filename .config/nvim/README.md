# nvim-setup

**Update 2023/03/31**: moved everything to [lazy.nvim](https://github.com/folke/lazy.nvim). Everything works but the directory structure changed a lot.

This is my nvim setup, made with the help of these resources: 
- [ThePrimeagen setup](https://github.com/ThePrimeagen/init.lua) and his [video](https://www.youtube.com/watch?v=w7i4amO_zaE)
- [TJ DeVries kickstarting file](https://github.com/nvim-lua/kickstart.nvim) and his [video](https://www.youtube.com/watch?app=desktop&v=stqUbv-5u2s)
- [Migrating from packer to lazy](https://www.youtube.com/watch?v=aqlxqpHs-aQ)

I keep a Notion page with all the plugins, commands, and remaps [here](https://federama.notion.site/nvim-36f9903eef544b73bfbb903184745e24).

[vim-tutor](vim-tutor.txt) (got from [here](https://gist.githubusercontent.com/hashrocketeer/852a4f878acd42abbf98f18278329bdc/raw/9e7f22d0bec184ea0bc54d1c5dd1d8863b3fc900/vimtutor.txt)) is a file that I used, together with [vim-be-good](https://github.com/ThePrimeagen/vim-be-good), to learn vim motions and basic commands.

You can find more about my personal process of learning vim [here](https://fede.bearblog.dev/learning-vim-and-configuring-nvim/) 🌱

## Requirements
The only requirements are [ripgrep](https://github.com/BurntSushi/ripgrep), used in telescope, and a [nerd font](https://github.com/ryanoasis/nerd-fonts).

## Installation
To install the configuration you just need to clone this repo in the config directory of nvim.
```
git clone https://github.com/0xfederama/nvim-setup.git ~/.config/nvim
```
Then open nvim and run `:Lazy` to make it download all the plugins and configurations.

