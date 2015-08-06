#!/bin/sh

echo Back up current vimrc
sudo mv /usr/share/vim/vimrc /usr/share/vim/vimrc.bak
echo Put custom vimrc
sudo cp ../linux/setting/vimrc /usr/share/vim/
