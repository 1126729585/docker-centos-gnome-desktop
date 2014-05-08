FROM traxtopel/centos
MAINTAINER Grant Williamson <traxtopel@gmail.com>

RUN \
  echo tolerant=1 >> /etc/yum.conf ;\
  yum localinstall -y http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm ;\
  setarch i386 yum install -y tigervnc-server openssh-server sudo vim-minimal which supervisor net-tools ;\
  setarch i386 yum install -y xorg-x11-server-Xvfb shadow-utils xorg-x11-fonts-Type1 xorg-x11-fonts-misc ;\
  setarch i386 yum install -y gnome-panel gnome-terminal gnome-applets nautilus ;\
  setarch i386 yum install -y firefox libreoffice thunderbird ;\
  setarch i386 yum clean all

# noVNC
ADD noVNC /noVNC/
ADD home /home/
ADD startup.sh /
ADD supervisord.conf /

EXPOSE 6080 5900 3000 22
ENTRYPOINT ["/startup.sh"]
