#!/usr/bin/bash

# Update the system and install essential packages
sudo pacman -Syu
sudo pacman -S base-devel git curl make

source ../common/setup_asdf.sh
setup_asdf

# Here u have python at least =]
python ./install_shell.py

# i like nvchad too, i shall find it...
source ../common/setup_lunarvim.sh
setup_lunarvim
