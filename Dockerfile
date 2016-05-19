FROM pritunl/archlinux:latest

MAINTAINER fdiblen <f.diblen@esciencecenter.nl>

RUN pacman -Syyu --noconfirm \
    iproute2 iputils procps-ng licenses tar which rsync util-linux git vim zsh \
    sudo xorg-apps

RUN echo "archsci    ALL=(ALL)    ALL" >> /etc/sudoers.d/archsci

RUN useradd -ms /bin/zsh -G users,wheel archsci && echo "archsci:archsci" | chpasswd
USER archsci
WORKDIR /home/archsci

CMD ["/bin/zsh"]
