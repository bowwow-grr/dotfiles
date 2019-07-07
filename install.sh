#!/bin/bash

NVIM_DIR=$HOME/.config/nvim
TMUX_CONF=$HOME/.tmux.conf
BASHRC=$HOME/.bashrc
BASH_LOGOUT=$HOME/.bash_logout

ln -s ~/dotfiles/nvim $NVIM_DIR
ln -s ~/dotfiles/.tmux.conf $TMUX_CONF
ln -s ~/dotfiles/.bashrc $BASHRC
ln -s ~/dotfiles/.bash_logout $BASH_LOGOUT
