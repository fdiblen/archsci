FROM pritunl/archlinux:latest

MAINTAINER fdiblen <f.diblen@esciencecenter.nl>

RUN pacman -Syyu --noconfirm --needed \
    iproute2 net-tools wget \
    rsync unzip git vim \
    zsh sudo fontconfig ttf-symbola

RUN rm -rfv /var/cache/pacman/pkg/*
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "en_US ISO-8859-1" >> /etc/locale.gen \
    && locale-gen


RUN echo "archsci    ALL=(ALL)    ALL" >> /etc/sudoers.d/archsci
RUN useradd -ms /bin/zsh -G users,wheel archsci \
    && echo "archsci:archsci" | chpasswd

WORKDIR /home/archsci
RUN chown archsci:archsci -R /home/archsci


COPY zshrc.template /home/archsci/.zshrc
COPY antigen.template /home/archsci/.antigen.archsci
COPY setShell.bash /home/archsci/setShell.bash
RUN chown -R archsci:archsci /home/archsci/


USER archsci
ENV HOME /home/archsci
ENV DISPLAY :0


RUN /bin/zsh /home/archsci/setShell.bash \
    && rm -f /home/archsci/setShell.bash



CMD ["/bin/zsh"]
