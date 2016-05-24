[![Automated Build](http://img.shields.io/badge/automated-build-green.svg)](https://hub.docker.com/r/fdiblen/archsci/)
[![Build Status](https://travis-ci.org/fdiblen/archsci.svg?branch=master)](https://travis-ci.org/fdiblen/archsci)

# archsci - Arch Linux Scientific
- latest Arch Linux image
- sudo support
- Minimal image (no X11)
- zsh shell, addons, powerline prompt (with git-status) and fonts
- Pre-installed yaourt, vim, git

Default shell prompt:
![prompt](https://raw.githubusercontent.com/fdiblen/archsci/master/prompt.png)


# Howto get
## base version
```{r, engine='bash', count_lines}
docker pull fdiblen/archsci:latest
```
## Julia version
```{r, engine='bash', count_lines}
docker pull fdiblen/archsci:julia
```
``` sh
