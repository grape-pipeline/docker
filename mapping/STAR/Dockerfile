# Dockerfile for STAR mapping step
#
# Tools
# -----
# STAR     v2.4.0j
# SAMtools v1.2
#
FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _STAR_VERSION 2.4.0j
ENV _SAMTOOLS_VERSION 1.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    make \
    build-essential \
    pigz \
    zlib1g-dev \
    libncurses-dev \
    vim-common

RUN mkdir -p build/samtools && curl -L https://github.com/samtools/samtools/releases/download/1.2/samtools-$_SAMTOOLS_VERSION.tar.bz2 | tar xj --strip-components=1 -C build/samtools 

RUN cd build/samtools && make && cp -p --update samtools /usr/local/bin

RUN mkdir -p build/STAR && curl -L https://api.github.com/repos/alexdobin/STAR/tarball/STAR_$_STAR_VERSION | tar xz --strip-components=1 -C build/STAR 

RUN cd build/STAR/source && make STAR && cp -p --update STAR /usr/local/bin

RUN apt-get remove -y perl make build-essential zlib1g-dev libncurses-dev vim-common && \
    apt-get autoremove -y 

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* build  
