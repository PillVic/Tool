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

add-apt-repository ppa:kelleyk/emacs
sudo apt update -y
sudo apt upgrade -y
sudo apt install unar racket vim emacs26 tmux htop tig tree zeal vim-powerline wireshark curl shellcheck
sudo apt install libreoffice-l10n-zh-cn  #add Chinese support for libreoffice
sudo apt install manpages-zh             #add Chinese support for man

#time set
sudo apt install ntpdate
sudo ntpdate cn.pool.ntp.org
sudo hwclock --localtime --systohc

#wireshark config
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 4755 /usr/bin/dumpcap
sudo gpasswd  -a "$USER" wireshark

#git config
read -r -p "[git config] input your email:" email
read -r -p "[git config] input your name:" name

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
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#install zsh theme
cd 
git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM"/themes/powerlevel10k
git clone https://github.com/zdharma/fast-syntax-highlighting.git \\                               
"$ZSH_CUSTOM"/plugins/fast-syntax-highlighting

#oh my tmux install 
git clone https://github.com/gpakosz/.tmux.git ~/
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local ~/

#spacemacs clone
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp -l ~/Tool/.spacemacs ~/
sudo apt install texlive-latex-recommended texlive-latex-extra dvipng #adding latex support for org mode

#font install
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
