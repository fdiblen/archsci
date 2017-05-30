#!/bin/sh

# clean cache
rm -rf /var/cache/pacman/pkg/*

pacman-key --refresh-keys

cp /etc/pacman.conf /etc/pacman.conf.bck
mv /home/archsci/temp/pacman.conf /etc/pacman.conf
cat /etc/pacman.conf

# dateYesterday=$(date +%Y/%m/%d -d "yesterday")
# echo "Server=https://archive.archlinux.org/repos/$dateYesterday/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

pacman -Syyuu --noconfirm

#pacman-key --refresh-keys

pacman -S --force --noconfirm --needed \
    iproute2 net-tools wget curl htop \
    rsync unzip git vim \
    adobe-source-code-pro-fonts ttf-ubuntu-font-family terminus-font freetype2 \
    zsh sudo fontconfig ttf-symbola \
    binutils gcc fakeroot make base-devel



# mv /etc/pacman.conf.bck /etc/pacman.conf
# pacman -Syyuu --noconfirm
