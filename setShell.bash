#!/bin/bash

## Oh-my-zsh
#curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh


#pip install --user git+git://github.com/powerline/powerline
pip install --user powerline-status
pip install --user powerline-gitstatus
pip install --user powerline-docker

# Fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# Font directories
mkdir -p ~/.fonts/
mkdir -p ~/.fonts.conf.d/
mkdir -p ~/.config/fontconfig/conf.d/

mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/

cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.fonts.conf.d/

fc-cache -vf ~/.fonts/

## Patched fonts
#mv 'SomeFont for Powerline.otf' ~/.fonts/
#fc-cache -vf ~/.fonts/


# Own settings
mkdir -p ~/.config/powerline

git clone https://github.com/jkubrynski/powerline-git-theme.git \
    && mv powerline-git-theme/powerline ~/.config/ \
    && rm -rf powerline-git-theme
