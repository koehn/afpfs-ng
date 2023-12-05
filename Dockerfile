FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
      automake \
      git \
      fuse \
      libfuse-dev \
      libgcrypt-dev \
      libgmp-dev \
      libreadline-dev \
      libncurses5-dev \
      make \
      gcc-8 && \
    ln -s /usr/bin/gcc-8 /usr/bin/gcc

COPY . /afpfs-ng 

RUN cd /afpfs-ng && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    cd / && rm -rf afpfs-ng

