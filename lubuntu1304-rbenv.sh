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
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev libncurses5-dev automake libtool bison subversion ttf-inconsolata gitk cmake

# install rbenv/Ruby
echo -e "\n=> Installing rbenv and Ruby 2.0.0...\n"
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'export PATH="./bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.0.0-p195 MAKE_OPTS="-j3"
rbenv rehash
rbenv global 2.0.0-p195

# install gVim
mkdir -p ~/installers
echo -e "\n=> Installing gVim dependencies...\n"
sudo apt-get -y install libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev mercurial python-dev
sudo apt-get -y remove vim-tiny vim-common vim-gui-common
echo -e "\n=> Downloading gVim source...\n"
hg clone http://code.google.com/p/vim/ /installers/vim --debug
echo -e "\n=> Building gVim...\n"
cd /installers/vim/src/
make distclean
./configure --with-features=huge --enable-gui=gtk2 --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/
make -j3
sudo make install
echo -e "\n=> Syncing gVim...\n"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
wget https://raw.github.com/bryanbibat/setup-scripts/master/.vimrc -O ~/.vimrc
vim +BundleInstall +qall
rm ~/.vimrc
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make -j3
cd ~/.vim/bundle/YouCompleteMe
./install.sh
wget https://raw.github.com/bryanbibat/setup-scripts/master/.gvimrc -O ~/.gvimrc

# install Node.js
echo -e "\n=> Downloading Node.js v0.10.12...\n"
cd /tmp
wget http://nodejs.org/dist/v0.10.12/node-v0.10.12.tar.gz
tar zxvf node-v0.10.12.tar.gz
echo -e "\n=> Building Node.js v0.10.12...\n"
cd node-v0.10.12
./configure
make -j3
sudo make install

echo -e "\n=> Adding desktops...\n"

cd /tmp
mkdir ~/.config/openbox/ -p
wget https://raw.github.com/bryanbibat/setup-scripts/master/lxde/lubuntu-rc.xml -O ~/.config/openbox/lubuntu-rc.xml
wget https://raw.github.com/bryanbibat/setup-scripts/master/lxde/setlayout.c
gcc -o setlayout setlayout.c -lX11
sudo cp setlayout /usr/local/bin/setlayout
mkdir ~/.config/autostart/ -p
echo "[Desktop Entry]

Type=Application
Exec=setlayout 1 2 2 0" > ~/.config/autostart/setlayout.desktop

echo -e "\n=> Remapping Caps Lock to Ctrl...\n"

sudo echo "#!/usr/bin/env bash" > /usr/bin/caps-remap.sh
sudo echo "setxkbmap -option ctrl:nocaps" >> /usr/bin/caps-remap.sh
sudo chmod +x /usr/bin/caps-remap.sh

sudo echo "@/usr/bin/caps-remap.sh" >> /etc/xdg/lxsession/Lubuntu/autostart

cd ~

# setup Git
echo -e "\n=> Setting up git...\n"
git config --global user.name "Bryan Bibat"
git config --global user.email "bry@bryanbibat.net"
wget https://raw.github.com/bryanbibat/setup-scripts/master/.gitignore_global -O ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
ssh-keygen -t rsa -C "bry@bryanbibat.net"

echo -e "\n=> Initial setup complete!\n"
echo -e "\n=> Final steps:\n   * Install VM guest additions\n   * Update font for terminal\n   * Enable system indicator\n   * (optional) Download/install ProggyFont http://www.proggyfonts.com/index.php?menu=download\n   * (optional) Replace gnome-terminal with Terminator\n"
