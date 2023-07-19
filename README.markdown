# brianjriddle's dotfiles

In process of moving this to nix, and home-manager


this is where i let my OCD reign free. there may not be any dragons lurking 
around here but there *might* be a wyvern or two.

## Usage

rake is used to install these in current users home.

## initial install

start off with

    rake install_base_files

## zsh
if you use zsh & want to start using oh-my-zsh

    rake install_oh_my_zsh

## tmux

    rake install_tmux

## vim

    rake update_vim_bundles
    rake install_vimrc
    rake install_vim

## warning

all rake tasks beginning with install napalms the target directories/files 
and then installs fresh from git.
