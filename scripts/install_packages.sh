#!/bin/sh

pacman-key --refresh-keys

cp /etc/pacman.conf /etc/pacman.conf.bck
mv /home/archsci/temp/pacman.conf /etc/pacman.conf
cat /etc/pacman.conf

# dateYesterday=$(date +%Y/%m/%d -d "yesterday")
# echo "Server=https://archive.archlinux.org/repos/$dateYesterday/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

pacman -Syyuu --noconfirm

pacman -S --force --noconfirm --needed \
     binutils gcc fakeroot make base-devel

pacman -S --force --noconfirm --needed \
    iproute2 net-tools wget curl \
    rsync unzip git vim \
    adobe-source-code-pro-fonts ttf-ubuntu-font-family terminus-font freetype2 \
    fontconfig ttf-symbola \
    zsh sudo htop \
    yaourt

#pacman -Rs --noconfirm \
#     binutils gcc fakeroot make base-devel
