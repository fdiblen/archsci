FROM pritunl/archlinux:latest

MAINTAINER fdiblen <f.diblen@esciencecenter.nl>

RUN pacman -Syyu --noconfirm --needed \
    iproute2 net-tools wget \
    rsync git vim \
    zsh sudo \
    xorg-xlogo python-pip

RUN rm -rfv /var/cache/pacman/pkg/*

RUN echo "archsci    ALL=(ALL)    ALL" >> /etc/sudoers.d/archsci
RUN useradd -ms /bin/zsh -G users,wheel archsci \
    && echo "archsci:archsci" | chpasswd

WORKDIR /home/archsci
RUN chown archsci:archsci -R /home/archsci


COPY zshrc.template /home/archsci/.zshrc
RUN chown archsci:archsci /home/archsci/.zshrc


USER archsci
ENV HOME /home/archsci
ENV DISPLAY :0


COPY setShell.bash /home/archsci/setShell.bash
RUN /bin/bash /home/archsci/setShell.bash \
    && rm -f /home/archsci/setShell.bash

CMD ["/bin/zsh"]
