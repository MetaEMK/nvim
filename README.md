# nvim configuration

## Installation

### Backup old configuration
` mv ~/.config/nvim/ ~/.config/nvim_backup `
` mv ~/.local/share/nvim/ ~/.local/share/nvim_backup`


### Install packer.vim
see install documentation: https://github.com/wbthomason/packer.nvim#quickstart

### Install Lazygit
see install documentation: https://github.com/jesseduffield/lazygit#installation

### Install configuration
1. `git clone https://github.com/metaemk/nvim_config ~/.config/nvim`
2. open nvim and press space or enter to continue
3. go in nvim to 2. open nvim and press space or enter to continue
4. go in nvim to lua / metaemk / packer.lua
5. ':so' and ':PackerSync'
6. reopen nvim -> no error should occure anymore
