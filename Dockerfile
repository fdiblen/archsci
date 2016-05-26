FROM pritunl/archlinux:latest

MAINTAINER fdiblen

RUN pacman -Syyu --noconfirm --needed \
    iproute2 net-tools wget \
    rsync unzip git vim \
    adobe-source-code-pro-fonts ttf-ubuntu-font-family terminus-font freetype2 \
    zsh sudo fontconfig ttf-symbola \
    base-devel

RUN rm -rfv /var/cache/pacman/pkg/*
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "en_US ISO-8859-1" >> /etc/locale.gen \
    && locale-gen


RUN echo "archsci    ALL=(ALL)    NOPASSWD:ALL" >> /etc/sudoers.d/archsci
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
ENV TERM xterm-256color
ENV USER archsci



# install yaourt (credit heichblatt)
RUN /usr/bin/mkdir -pv /tmp/yaourt_install && \
    cd /tmp/yaourt_install && \
    /usr/sbin/sudo /usr/sbin/pacman -S --needed yajl gettext diffutils git --noconfirm && \
    /usr/sbin/curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=package-query" && \
    /usr/sbin/makepkg PKGBUILD && \
    /usr/sbin/sudo /usr/sbin/pacman -U package-query*.tar.xz --noconfirm && \
    /usr/sbin/curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yaourt" && \
    /usr/sbin/makepkg PKGBUILD && \
    /usr/sbin/sudo /usr/sbin/pacman -U yaourt*pkg*.tar.xz --noconfirm && \
    cd && \
    /usr/sbin/rm -rv /tmp/yaourt_install


RUN /bin/zsh /home/archsci/setShell.bash \
    && rm -f /home/archsci/setShell.bash


CMD ["/bin/zsh"]
