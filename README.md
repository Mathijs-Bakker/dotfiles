# .dotfiles

NeoVim, Tmux and Zsh configurations. 

My setup, for DotNet Core and Unity3D development on MacOS (or other nix system). 

Different projects have different requirements. So next to C#, I do occasionally Ecmascript, LUA, Python and other languages. Whatever suits best for a project.

### Nvim
I have sourced my plugin configurations for easy toggling (read: commenting out) in ``nvim/rc/plugins.vim``.

```
.
├── LICENSE
├── README.md
├── Ranger
│   ├── plugins
│   │   └── devicons2
│   └── rc.conf
├── applescripts
│   ├── tunes.js
│   └── tunes.scpt
├── bin
│   ├── battery
│   ├── battery_indicator.sh
│   ├── colortest
│   ├── confirm
│   ├── extract
│   ├── fh
│   ├── fromhex
│   ├── git-clc
│   ├── git-kill
│   ├── git-modified
│   ├── isdir
│   ├── isfile
│   ├── manage
│   ├── reload-browser
│   └── tm
├── iterm
│   ├── color presets
│   │   └── Gruvbox Dark.itermcolors
│   └── profile.json
├── karabiner
│   ├── assets
│   │   └── complex_modifications
│   └── karabiner.json
├── nvim
│   ├── autoload
│   │   └── helpers
│   │       └── lightline.vim
│   ├── ginit.vim
│   ├── init.vim
│   ├── rc
│   │   ├── base.vim
│   │   ├── pluginconfigs
│   │   │   ├── ale.vim
│   │   │   ├── coc.vim
│   │   │   ├── deoplete.vim
│   │   │   ├── fzf.vim
│   │   │   ├── languageclient-neovim.vim
│   │   │   ├── lightline.vim
│   │   │   ├── nerdtree.vim
│   │   │   ├── omnisharp.vim
│   │   │   ├── ranger.vim
│   │   │   ├── startify.vim
│   │   │   ├── syntastic.vim
│   │   │   └── ultisnips.vim
│   │   └── plugins.vim
│   ├── syntax
│   │   └── csharp.vim
├── resources
│   ├── tmux.terminfo
│   └── xterm-256color-italic.terminfo
├── tmux
│   ├── base16.sh
│   └── tmux.conf.symlink
└── zsh
    ├── functions
    │   ├── _c
    │   ├── _h
    │   ├── c
    │   ├── g
    │   ├── h
    │   ├── last_modified
    │   ├── md
    │   ├── prepend_path
    │   ├── verbose_completion
    │   └── zfetch
    ├── git_prompt.zsh
    ├── jobs_prompt.zsh
    ├── prompt.zsh
    ├── utils.zsh
    ├── zshenv.symlink
    └── zshrc.symlink
```
