#!/bin/sh

echo Back up current vimrc
sudo mv /etc/vim/vimrc /etc/vim/vimrc.bak
echo Put custom vimrc
sudo cp setting/vimrc /etc/vim/vimrc
