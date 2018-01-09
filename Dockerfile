FROM base/archlinux:latest

MAINTAINER fdiblen

ENV container docker
ENV LC_ALL C


USER root


# ADD NORMAL USER
#===========================================
RUN useradd -ms /bin/zsh -G users,wheel archsci \
    && echo "archsci:archsci" | chpasswd


# ADD SCRIPTS
#===========================================
RUN mkdir -p /home/archsci/temp
COPY scripts/*.sh /home/archsci/temp/
RUN chmod +x /home/archsci/temp/*.sh
COPY confs/zshrc.template /home/archsci/.zshrc
COPY confs/antigen.template /home/archsci/.antigen.archsci
COPY confs/pacman.conf /home/archsci/temp


# INSTALL AUR HELPER AND PACKAGES
#===========================================
RUN /home/archsci/temp/install_packages.sh



# SET ENVIRONMENT, USER and SUDO
#===========================================
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "en_US ISO-8859-1" >> /etc/locale.gen \
    && locale-gen

RUN echo "archsci    ALL=(ALL)    NOPASSWD:ALL" >> /etc/sudoers.d/archsci

WORKDIR /home/archsci
RUN chown archsci:archsci -R /home/archsci


# NORMAL USER
#===========================================
USER archsci
ENV HOME /home/archsci
ENV DISPLAY :0
ENV EDITOR vim
ENV TERM xterm-256color
ENV USER archsci
ENV SHELL /usr/bin/zsh


# AUR PACKAGES
#===========================================
WORKDIR /home/archsci
RUN /home/archsci/temp/set_shell.sh
RUN /home/archsci/temp/aur.sh


# CLEAN UP
#===========================================
RUN /home/archsci/temp/clean.sh

RUN /bin/zsh

CMD ["/bin/zsh"]
