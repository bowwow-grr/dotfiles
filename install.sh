#!/bin/bash

rm -r ~/.config/nvim
rm ~/.tmux.conf
rm ~/.bashrc
rm ~/.bash_logout

ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_logout ~/.bash_logout
