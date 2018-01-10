#!/bin/zsh

sudo pacman -S --noconfirm --needed \
    supervisor \
    openssh

# don not use the default config
sudo mkdir -p /etc/supervisor/conf.d/

sudo sh -c 'sh /home/archsci/temp/scripts/add_services.sh'
