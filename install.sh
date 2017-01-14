#!/bin/bash

# DEFINE BASE VARIABLES
os=$(uname)
dname=$(cd $(dirname $0) && pwd)
bpkgs="ssh git"
pkgs="fizsh vim tmux"

# PACKAGES CONFIGURATION
if [ "$os" =  "Linux" ]
then
    sudo apt-get update
    sudo apt-get install -y --force-yes $bpkgs $pkgs
elif [ "$os" = "Darwin" ]
then
    brew update
    brew install $pkgs
fi 

# GIT
echo "Git configuration"
echo "Enter your name :"
read name
git config --global user.name $name
echo "Enter your email :"
read email
git config --global user.email $email

# TMUX (ITERM LIKE)
cp $dname/tmux.conf $HOME/.tmux.conf

# VIM
git clone --depth=1 --branch=master https://github.com/amix/vimrc.git $HOME/.vim_runtime
sh $HOME/.vim_runtime/install_awesome_vimrc.sh

# FIZSH
echo "To use fizsh as default shell, change /etc/passwd."

echo "Installation, done !"
