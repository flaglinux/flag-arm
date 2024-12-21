# Ubuntu 18.04 for Cam-AI SDK
#
# VERSION	1.0

FROM ubuntu:18.04
LABEL Maintainer="Sundew Shin <sundew@wednus.com>" \
      Description="Cam-AI Kernel SDK" \
      Reference="https://github.com/flaglinux/flag-arm/tree/release-camai_core"

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker; \
  echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker; \
  dpkg --add-architecture i386; \
  DEBIAN_FRONTEND=noninteractive apt-get update; apt-get -y upgrade; \
  apt-get -y install \
  build-essential libncurses5-dev zlib1g-dev gawk git git-core ccache gettext libssl-dev xsltproc gperf subversion pkg-config \
  sudo wget nano zip unzip htop file libsigsegv-dev gperf busybox python ca-certificates \
  libc6:i386 libstdc++6:i386 zlib1g:i386; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install older version of OpenSSL
ENV OPENSSL_VERSION=1.0.2u \
  INSTALL_DIR=/usr/local/ssl

RUN wget https://www.openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz; \
    tar -xvzf openssl-$OPENSSL_VERSION.tar.gz; cd openssl-$OPENSSL_VERSION; \
    ./config --prefix=$INSTALL_DIR --openssldir=$INSTALL_DIR shared zlib; \
    make; make install; \
    echo "$INSTALL_DIR/lib" > /etc/ld.so.conf.d/openssl-$OPENSSL_VERSION.conf; \
    ldconfig; cd ..; \
    rm -rf openssl-$OPENSSL_VERSION openssl-$OPENSSL_VERSION.tar.gz

RUN useradd -m -N -s /bin/bash ubuntu; \
  usermod -aG sudo ubuntu; \
  echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers; \
  echo "Defaults lecture=never" >> /etc/sudoers; \
  touch /home/ubuntu/.hushlogin

USER ubuntu
WORKDIR /home/ubuntu
ADD *.sh ./

# keep it alive
CMD tail -f /dev/null
