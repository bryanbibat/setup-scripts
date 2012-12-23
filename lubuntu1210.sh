#!/bin/bash
shopt -s nocaseglob

# switch to faster server (ph.archive.ubuntu.com is in UK)
echo -e "\n=> Updating your system...\n"
sudo sed -i.bak 's/ph.archive.ubuntu.com/ftp.tsukuba.wide.ad.jp\/Linux/' /etc/apt/sources.list

# update system
sudo apt-get update
sudo apt-get -y dist-upgrade

# install build tools, rvm/ruby dependencies, and other basic stuff (git, Inconsolata)
echo -e "\n=> Installing basic packages...\n"
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev libncurses5-dev automake libtool bison subversion ttf-inconsolata gitk

# install RVM/Ruby
echo -e "\n=> Installing RVM and Ruby 1.9.3...\n"
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
~/.rvm/bin/rvm install 1.9.3
~/.rvm/bin/rvm use 1.9.3 --default

# install gVim
echo -e "\n=> Installing gVim dependencies...\n"
sudo apt-get -y install libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev mercurial
echo -e "\n=> Downloading gVim source...\n"
hg clone http://code.google.com/p/vim/ /tmp/vim --debug
echo -e "\n=> Building gVim...\n"
cd /tmp/vim/src/
make distclean
./configure --with-features=huge --enable-gui=gnome2 --enable-rubyinterp 
make
sudo make install
echo -e "\n=> Syncing gVim...\n"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
wget https://raw.github.com/bryanbibat/setup-scripts/master/.vundle -O ~/.vimrc
vim +BundleInstall +qall
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
wget https://raw.github.com/bryanbibat/setup-scripts/master/.vimrc -O ~/.vimrc

# install Node.js
echo -e "\n=> Downloading Node.js v8.16...\n"
cd /tmp
wget http://nodejs.org/dist/v0.8.16/node-v0.8.16.tar.gz
tar zxvf node-v0.8.16.tar.gz
echo -e "\n=> Building Node.js v8.16...\n"
cd node-v0.8.1
./configure
make
sudo make install

cd ~

# setup Git
echo -e "\n=> Setting up git...\n"
git config --global user.name "Bryan Bibat"
git config --global user.email "bry@bryanbibat.net"
wget https://raw.github.com/bryanbibat/setup-scripts/master/.gitignore_global -O ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
ssh-keygen -t rsa -C "bry@bryanbibat.net"

echo -e "\n=> Installing system monitor indicator...\n"
sudo apt-get -y install indicator-multiload

echo -e "\n=> Initial setup complete!\n"
echo -e "\n=> Final steps:\n   * Install VM guest additions\n   * Update font for terminal\n   * Enable system indicator\n"
