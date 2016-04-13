FROM pritunl/archlinux:latest

MAINTAINER fdiblen <f.diblen@esciencecenter.nl>

RUN pacman -Syyu --noconfirm
RUN pacman -S --needed --noconfirm iproute2 iputils procps-ng licenses
RUN pacman -S --needed --noconfirm tar which rsync util-linux
RUN pacman -S --needed --noconfirm git 
RUN pacman -S --needed --noconfirm vim
RUN pacman -S --needed --noconfirm zsh 

RUN useradd -ms /bin/zsh fdiblen
USER fdiblen
WORKDIR /home/fdiblen

CMD ["/bin/zsh"]



