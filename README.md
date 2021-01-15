# VIM ENVIRONMENT

Just my vim setting with curated plugins. Minimalized.


## PREREQUISITE

vim >= 8.2
node >= 12

neovim >= I don't know. Probably don't even work.

PS. I recommend a font like powerline, cascadia code or delugia nerd.
Pretty authentic.


## Installation Guide

1. Clone this repository.
2. Make sure that your vim installation is correct (>= 8.2). Otherwise, don't use coc.nvim due to missing `complete_info` function will be is missing.
3. Check if nodejs >= 12.
3. Run apply.sh
4. Happy Vim. Happy Life. Happy Uganda children (Some charity won't bad eh ?)


## Rollback

Execute `rollback.sh` will automatically rollback your previous setting with backup.
If no backup was found and you happened to not specified the backup path.
Or choose not to use backup, will just remove everything.


## Plugins


- 'terryma/vim-multiple-cursors'
- 'airblade/vim-gitgutter'
- 'vim-airline/vim-airline'
- 'junegunn/vim-easy-align'
- 'tpope/vim-fugitive'
- 'tpope/vim-surround'
- 'tpope/vim-commentary'
- 'neoclide/coc.nvim'
- 'nathanaelkane/vim-indent-guides'
- 'patstockwell/vim-monokai-tasty'
- 'preservim/nerdtree'
- 'junegunn/fzf'


## Coc-Plugins

- coc-snippets
- coc-json
- coc-tsserver
- coc-pyright


## FAQ


Q: My linux distribution doesn't have vim 8.2 available from official package.
A: Install from source. Faster, More secure. Adding PPO is too roundabout.

Q: I use neovim, can I use this environment ?
A: I don't know.

Q: Some plugin is no longer available ?
A: Either I no longer use that plugin (That's why I do not notice and remove it). I still have that plugin locally.

Q: Is this constantly maintained ?
A: NO. Fork it.

Q: I submitted a pull request.
A: Only bug fixes PRs are accepted. Otherwise, Fork it.

Q: How to use apply.sh ?
A: It guide you step by step, should not be a problem.

Q: Your keymapping is suck.
A: lol.

Q: I want more coc plugins.
A: Add what you want to `coc-plugins` and it should be automatically apply.

## License

Just fork or copy or anything. IDC.
