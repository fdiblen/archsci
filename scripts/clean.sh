#!/bin/sh

sudo paccache -ruk0 && \
    sudo pacman --noconfirm -Scc && \
    sudo rm -rf /home/archsci/temp && \
    sudo rm -rf /home/archsci/.cache && \
    sudo rm -rf /var/cache/pacman/pkg/*
    sudo rm -rf yaourt-tmp-*
