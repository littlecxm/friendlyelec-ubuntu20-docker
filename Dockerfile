FROM ubuntu:focal

RUN apt-get update

RUN echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections
RUN echo 'tzdata tzdata/Zones/Asia select Chongqing' | debconf-set-selections
RUN DEBIAN_FRONTEND="noninteractive" apt install -y tzdata
RUN apt-get -y install texinfo

# Install required packages for FriendlyElec's boards
RUN apt-get -y install texinfo git
RUN git clone https://github.com/friendlyarm/build-env-on-ubuntu-bionic
RUN chmod 755 build-env-on-ubuntu-bionic/install.sh
RUN build-env-on-ubuntu-bionic/install.sh
RUN rm -rf build-env-on-ubuntu-bionic
RUN update-alternatives --install $(which python) python /usr/bin/python2.7 20
RUN git clone https://github.com/friendlyarm/repo
RUN cp repo/repo /usr/bin/

# Install other required packages
RUN apt-get install -y --no-install-recommends -qq \
    software-properties-common locales \
    nano bash-completion lxtask openssh-server xdotool filezilla putty dnsutils \
    papirus-icon-theme fonts-noto-cjk fonts-noto-cjk-extra obconf lxappearance-obconf vim terminator tree rsync \
    poppler-utils shared-mime-info mime-support
RUN	apt-get clean


RUN echo "root:fa" | chpasswd
RUN groupadd -g 1000 ubuntu
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
RUN echo "ubuntu:fa" | chpasswd

RUN mkdir -p /opt/work-tzs
RUN chown ubuntu /opt/work-tzs

USER root
WORKDIR /root

RUN echo "all done."