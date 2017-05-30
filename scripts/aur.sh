#!/bin/sh


# # PACAUR
# # ================================================
# # taken from to https://gist.github.com/Tadly
#
# mkdir -p /tmp/pacaur_install
# cd /tmp/pacaur_install
#
# sudo pacman -S expac yajl git --noconfirm --needed
# source /etc/profile.d/perlbin.sh
#
# # Install "cower" from AUR
# if [ ! -n "$(pacman -Qs cower)" ]; then
#     curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
#     makepkg PKGBUILD --skippgpcheck --install --needed
# fi
#
# # Install "pacaur" from AUR
# if [ ! -n "$(pacman -Qs pacaur)" ]; then
#     curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
#     makepkg PKGBUILD --skippgpcheck --install --needed
# fi
#
# # Clean up...
# cd ~
# rm -r /tmp/pacaur_install
#
#
# pacaur -S --noconfirm --needed \
#     byobu
#


buildroot="$(mktemp -d)"

# Ask for user passwort once, see sudo(8).
sudo -v

# Make sure we can even build packages on arch linux.
sudo pacman -S --needed --noconfirm base-devel git

mkdir -p "$buildroot"
cd "$buildroot" || exit 1

# Arch Linux ARM provides a cower package for the RPI!
# Let's either install 'cower' via pacman, or build it.
if [ "$(uname -n)" = 'alarmpi' ]; then
	sudo pacman -S cower
else
	# Fetch Dave Reisner's key to be able to verify cower.
	gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 487EACC08557AD082088DABA1EB2638FF56C0C53
	git clone --depth=1 "https://aur.archlinux.org/cower.git"
	cd "${buildroot}/cower" || exit 1
	makepkg --syncdeps --skippgpcheck --install --noconfirm
fi

cd "$buildroot" || exit 1
git clone --depth=1  "https://aur.archlinux.org/pacaur.git"

cd "${buildroot}/pacaur" || exit 1
makepkg --syncdeps --skippgpcheck --install --noconfirm

cd "$HOME" || exit 1
rm -rf "$buildroot"
