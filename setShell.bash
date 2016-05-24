#!/bin/zsh

# Antigen
echo "Setting antigen"
echo

git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen
echo "source ${HOME}/.antigen/antigen.zsh" >> ${HOME}/.zshrc
echo "source ${HOME}/.antigen.archsci" >> ${HOME}/.zshrc

source ${HOME}/.antigen/antigen.zsh
source ${HOME}/.antigen.archsci
source ${HOME}/.zshrc


# Fonts
echo "Getting fonts"
echo

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# Font directories
mkdir -p ~/.fonts/
mkdir -p ~/.fonts.conf.d/
mkdir -p ~/.config/fontconfig/conf.d/

mv PowerlineSymbols.otf ~/.fonts/

cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.fonts.conf.d/

## Patched fonts
#mv 'SomeFont for Powerline.otf' ~/.fonts/
#fc-cache -vf ~/.fonts/

cd && git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh
cd && rm -rf fonts

cd && mkdir -p fonts && cd fonts && wget https://cdn.rawgit.com/larsenwork/monoid/138e2bd5a459265522f0471ec7fa5401525b660b/Monoid.zip
unzip Monoid.zip && mv *.ttf ~/.fonts/
cd && rm -rf fonts Monoid.zip

fc-cache -vf ~/.fonts/
fc-cache -vf ~/.fonts.conf.d/
fc-cache -vf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.local/share/fonts
