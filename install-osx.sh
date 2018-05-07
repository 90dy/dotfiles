#!/bin/bash

echo "\ninstall brew ..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "configure git ..."
mkdir $HOME/Repos
echo "What is your name ?"
echo -e "> git config --global user.name \c"
read name
echo "What is your email address ?"
git config --global user.name "$name"
echo -e "> git config --global user.email \c"
read email
git config --global user.email $email
git config --global pull.rebase true

echo "\ninstall oh-my-zsh ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussel/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/abertsch/Menlo-for-Powerline $HOME/Repos/github.com/abertsch/Menlo-for-Powerline
cp $HOME/Repos/github.com/abertsch/Menlo-for-Powerline/Menlo* $HOME/Library/Fonts
echo "ZSH_THEME=\"agnoster\"" >> $HOME/.zshrc
source $HOME/.zshrc

echo "\ninstall and configure vim ..."
git clone https://github.com/gponsinet/vimrc $HOME/Repos/github.com/gponsinet/vimrc
rm -rf $HOME/.vim
ln -s $HOME/Repos/github.com/gponsinet/vimrc $HOME/.vim
cd $HOME/.vim
./install.sh
cd -

echo "\ninstall bat ..."
brew install cmake
cargo install bat
echo '
export PATH=$HOME/.cargo/bin:$PATH
' >> $HOME/.zshrc

echo "\ninstall exa ..."
cargo install exa
ln -s $HOME/.cargo/bin/exa $HOME/.cargo/bin/ls

echo "\ninstall iterm2 ..."
brew install caskroom/cask/iterm2

echo "\ninstall chrome ..."
brew install caskroom/cask/google-chrome chrome-cli

echo "\ninstall slack ..."
brew install caskroom/cask/slack

echo "\ninstall discord ..."
brew install caskroom/cask/discord

echo "\ninstall 1password ..."
brew install caskroom/cask/1password

echo "\ninstall xcode ..."
brew install mas
mas lucky xcode
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

echo "\ninstall android-studio ..."
brew install caskroom/versions/java8
brew install caskroom/cask/android-studio
echo '
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
' >> $HOME/.zshrc
source $HOME/.zshrc
touch $HOME/.android/repositories.cfg
echo "y" | sdkmanager ndk-bundle
echo "y" | sdkmanager "system-images;android-27;google_apis_playstore;x86"

echo "\ninstall react-native-debugger ..."
brew install caskroom/cask/react-native-debugger

echo "\ninstall ruby with bundler"
brew install ruby
echo 'export PATH=/usr/local/opt/ruby@2.3/bin:$PATH' >> $HOME/.zshrc
source $HOME/.zshrc
gem install bundler

echo "\ninstall go and gomobile ..."
brew install go
mkdir $HOME/.go
echo '
export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$PATH
export PATH=$GOROOT/bin:$PATH
' >> ~/.zshrc
source $HOME/.zshrc
ln -s $HOME/Repos $HOME/.go/src
go get golang.org/x/tool/cmd/godoc
go get golang.org/x/mobile/cmd/gomobile

echo "\ninstall docker ..."
brew install caskroom/cask/docker

echo "\ninstallation, done !"
