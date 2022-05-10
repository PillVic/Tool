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

sudo pacman -S yay
yay -Syu
yay -S install unar racket vim emacs26 tmux htop tig tree zeal vim-powerline wireshark curl shellcheck fzf
#install faster grep
yay -S install silversearcher-ag
yay -S install bat fd-find ncdu
yay -S install libreoffice-l10n-zh-cn  #add Chinese support for libreoffice
yay -S install manpages-zh             #add Chinese support for man
yay -S install manpages-de manpages-de-dev manpages-dev glibc-doc manpages-posix-dev manpages-posix # full man page
yay -S install tldr                    #add command help for linux
yay -S install ranger                  #terminal file manager
yay -S ueberzug                        #for image preview
yay -S ffmpegthumbnailer               #for video preview

#install coq
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install coq-prover

#time set
yay -S install ntpdate
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

#mysql install
yay -S install mysql-server mycli
#java install
yay -S install openjdk-17-jdk
yay -S install maven

#vim plug install 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#vim color scheme install 
mkdir ~/.vim
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim
cp -l .vimrc ~/
#vim completion config
yay -S install clangd
#nodejs v14 install
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
yay -y nodejs
#npm 换源
npm config set registry https://registry.npm.taobao.org

#arthas install
curl -L https://arthas.aliyun.com/install.sh | sh

#zsh config
plugpath="/home/$USER/.zsh-plugin"
mkdir "$plugpath"
cp -l  "/home/$USER/Tool/.zshrc" ~/
cd "$plugpath"
git clone git@github.com:Aloxaf/fzf-tab.git
git clone git@github.com:zdharma-continuum/fast-syntax-highlighting.git
git clone git@github.com:romkatv/powerlevel10k.git
cd


#oh my tmux install 
git clone https://github.com/gpakosz/.tmux.git ~/
ln -s -f .tmux/.tmux.conf ~/
cp .tmux/.tmux.conf.local ~/

#spacemacs clone
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp -l ~/Tool/.spacemacs ~/
yay -S texlive-latex-recommended texlive-latex-extra dvipng #adding latex support for org mode

#font install
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
