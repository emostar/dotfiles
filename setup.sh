#!/bin/sh

if [ -d ~/.my-dotfiles ]
then
  echo "\033[0;33mYou already have My Dotfiles installed.\033[0m You'll need to remove ~/.my-dotfiles if you want to install"
  exit
fi

echo "\033[0;34mCloning My Dotfiles...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/mathrawka/dotfiles.git ~/.my-dotfiles || {
  echo "git not installed"
  exit
}

# Install some packages
# TODO Check if I ever use a non debian based distro
sudo apt-get install htop

# Install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install dotvim
git >/dev/null && /usr/bin/env git clone https://github.com/mathrawka/dotvim.git ~/.my-dotfiles/dotvim
cd ~/.my-dotfiles/dotvim
setup.sh

# Copy the bin files
mkdir -p ~/bin
cp ~/.my-dotfiles/bin/* ~/bin

# Copy the dotfiles
cp ~/.my-dotfiles/dotfiles/* ~

cd ~
