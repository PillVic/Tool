#!/bin/bash

#x: print the command before excute it
#e: once a command fail (return no zero)
#u: when using undefined variable, exit
#o pipefail: once a single pipe fail exit
set -xeuo pipefail

#specially for ubuntu

#the following command is suggested to be done by hand
#ssh key create
#ssh-keygen -t rsa  -C "$email"
#echo "Your key is in ~/.ssh, copy id_rsa.pub to your github account"

#This script is for automatically install the necessary environment

add-apt-repository ppa:zeal-developers/ppa
add-apt-repository ppa:kelleyk/emacs
apt update -y
apt upgrade -y
apt install unar racket vim emacs26 tmux htop tig tree zeal vim-powerline wireshark texlive-generic-recommend

#wireshark config
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 4755 /usr/bin/dumpcap
sudo gpasswd  -a $USER wireshark

#git config
echo -p "[git config] input your email:" email
echo -p "[git config] input your name:" name

git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.quotepath false #let Chinese display normal


#vim plug install 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#vim color scheme install 
mkdir ~/.vim
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim
cp -l .vimrc ~/

#oh my zsh install 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install zsh theme
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zdharma/fast-syntax-highlighting.git \\                               
$ZSH_CUSTOM/plugins/fast-syntax-highlighting
#oh my tmux install 
git clone https://github.com/gpakosz/.tmux.git ~/
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local ~/

#spacemacs clone
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp -l .spacemacs ~/
