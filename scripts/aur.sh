#!/bin/sh


# PACAUR
# ================================================
# taken from to https://gist.github.com/Tadly

mkdir -p /tmp/pacaur_install
cd /tmp/pacaur_install

sudo pacman -S expac yajl git --noconfirm --needed

# Install "cower" from AUR
if [ ! -n "$(pacman -Qs cower)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
    makepkg PKGBUILD --skippgpcheck --install --needed
fi

# Install "pacaur" from AUR
if [ ! -n "$(pacman -Qs pacaur)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
    makepkg PKGBUILD --install --needed
fi

# Clean up...
cd ~
rm -r /tmp/pacaur_install


pacaur -S --noconfirm --needed \
    byobu
