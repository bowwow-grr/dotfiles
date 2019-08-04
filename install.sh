#!/bin/bash

DOTFILES=$HOME/dotfiles
DOTCOFIG=$HOME/.config
NVIM_DIR=$HOME/.config/nvim
TMUX_CONF=$HOME/.tmux.conf
BASHRC=$HOME/.bashrc
BASH_LOGOUT=$HOME/.bash_logout
INIT_EL=$HOME/.emacs.d/init.el 

if [ ! -e ${DOTCOFIG} ]; then eval 'mkdir ${DOTCOFIG}'

ln -s $DOTFILES/nvim $NVIM_DIR 
ln -s $DOTFILES/.tmux.conf $TMUX_CONF
ln -s $DOTFILES/.bashrc $BASHRC
ln -s $DOTFILES/.bash_logout $BASH_LOGOUT
ln -s $DOTFILES/init.el $INIT_EL
