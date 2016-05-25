[![Automated Build](http://img.shields.io/badge/automated-build-green.svg)](https://hub.docker.com/r/fdiblen/archsci/)

# archsci - Arch Linux Scientific
- latest Arch Linux image
- sudo support
- Minimal image (no X11)
- zsh shell, addons, powerline prompt (with git-status) and fonts
- Pre-installed yaourt, vim, git

Default shell prompt:
![prompt](https://raw.githubusercontent.com/fdiblen/archsci/master/prompt.png)


# Howto get
## base version (307 MB)
[![Build Status](https://travis-ci.org/fdiblen/archsci.svg?branch=master)](https://travis-ci.org/fdiblen/archsci)
```{r, engine='bash', count_lines}
docker pull fdiblen/archsci:latest
```

## Julia version (545 MB)
[![Build Status](https://travis-ci.org/fdiblen/archsci.svg?branch=julia)](https://travis-ci.org/fdiblen/archsci)
```{r, engine='bash', count_lines}
docker pull fdiblen/archsci:julia
```
see [Julia branch]

## Anaconda version (2 GB)
[![Build Status](https://travis-ci.org/fdiblen/archsci.svg?branch=anaconda)](https://travis-ci.org/fdiblen/archsci)
```{r, engine='bash', count_lines}
docker pull fdiblen/archsci:anaconda
```
see [Anaconda branch]



[Julia branch]: https://github.com/fdiblen/archsci/tree/julia
[Anaconda branch]: https://github.com/fdiblen/archsci/tree/anaconda

