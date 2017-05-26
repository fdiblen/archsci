#!/bin/sh

pacman -Syyuu --force
pacman -S archlinux-keyring
pacman-key --populate

pacman -S --force --noconfirm --needed \
    iproute2 net-tools wget curl htop \
    rsync unzip git vim \
    adobe-source-code-pro-fonts ttf-ubuntu-font-family terminus-font freetype2 \
    zsh sudo fontconfig ttf-symbola \
    binutils gcc fakeroot make base-devel
