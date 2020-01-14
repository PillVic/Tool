#!/bin/bash

#This script is for automatically install the necessary environment

apt update -y
apt upgrade -y
add-apt-repository ppa:zeal-developers/ppa
add-apt-repository ppa:kelleyk/emacs
apt update -y
apt upgrade -y
apt install git tig unar racket vim emacs26 tmux htop tig tree wireshark zeal 

#git config
echo -p "[git config] input your email:" email
echo -p "[git config] input your name:" name

git config --global user.email "$email"
git config --global user.name "$name"

#ssh key create

ssh-keygen -t rsa  -C "$email"
echo "Your key is in ~/.ssh, copy id_rsa.pub to your github account"
