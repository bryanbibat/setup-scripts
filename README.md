# Bry's setup scripts

Scripts for setting up new development machines. Parts shamelessly ripped from [railsready.sh](https://github.com/joshfng/railsready).

## Ubuntu 12.04

    wget --no-check-certificate https://raw.github.com/bryanbibat/setup-scripts/master/ubuntu1204.sh && bash ubuntu1204.sh

## Lubuntu 12.10

Install Gnome Terminal first

    sudo apt-get install gnome-terminal
    sudo update-alternatives --config x-terminal-emulator

Change the settings according to the [RVM site](https://rvm.io/integration/gnome-terminal/). Reopen the terminal before running the script.

    wget --no-check-certificate https://raw.github.com/bryanbibat/setup-scripts/master/lubuntu1210.sh && bash lubuntu1210.sh

## Mint 13 Cinnamon

    wget --no-check-certificate https://raw.github.com/bryanbibat/setup-scripts/master/mint13cin.sh && bash -l mint13cin.sh
