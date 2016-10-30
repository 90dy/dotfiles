#/bin/sh

# DEFINE BASE VARIABLES
os=$(uname)
dname=$(readlink -f $(dirname $0))
pkgs="zsh ssh git vim tmux"

# PACKAGES CONFIGURATION
if [ "$os" =  "Linux" ]
then
    #sudo apt-get update
    sudo apt-get install -y --force-yes $pkgs
elif [ "$os" = "Darwin" ]
then
    brew update
    brew install $pkgs
fi 

# GIT CONFIG
echo "Git configuration"
echo "Enter your name :"
read name
git config --global user.name $name
echo "Enter your email :"
read email
git config --global user.email $email

# ZSH CONFIGURATION
git clone --depth=1 --branch=master https://github.com/zsh-users/antigen.git $HOME/.antigen
cp $dname/zshrc $HOME/.zshrc

# TMUX CONFIGURATION (ITERM LIKE AND PERSONAL)
cp $dname/tmux.conf $HOME/.tmux.conf

# VIM CONFIGURATION
git clone --depth=1 --branch=master https://github.com/amix/vimrc.git $HOME/.vim_runtime
sh $HOME/.vim_runtime/install_awesome_vimrc.sh
