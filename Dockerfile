FROM pritunl/archlinux:latest

MAINTAINER fdiblen <f.diblen@esciencecenter.nl>

RUN pacman -Syyu --noconfirm --needed \
    iproute2 net-tools wget \
    rsync git vim \
    zsh sudo \
    xorg-xlogo

RUN echo "archsci    ALL=(ALL)    ALL" >> /etc/sudoers.d/archsci
RUN useradd -ms /bin/zsh -G users,wheel archsci && echo "archsci:archsci" | chpasswd

WORKDIR /home/archsci
ADD zshrc /home/archsci/.zshrc
RUN chown archsci:archsci -R /home/archsci

USER archsci
ENV HOME /home/archsci
ENV DISPLAY :0

CMD ["/bin/zsh"]
