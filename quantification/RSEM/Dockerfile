# Dockerfile for GRAPE quantification step
#
# Tools
# -----
# RSEM  v1.2.21
#
FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _RSEM_VERSION 1.2.21
ENV _SAMTOOLS_VERSION 1.2-rglab-CRG
ENV PATH /build/rsem:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    make \
    build-essential \
    zlib1g-dev \
    libncurses-dev \
    perl \
    r-base

RUN mkdir -p build/samtools && curl -L https://github.com/emi80/samtools/releases/download/$_SAMTOOLS_VERSION/samtools-$_SAMTOOLS_VERSION.tar.bz2 | tar xj --strip-components=1 -C build/samtools 

RUN cd build/samtools && make && make install

RUN mkdir -p build/rsem && curl -L http://deweylab.biostat.wisc.edu/rsem/src/rsem-$_RSEM_VERSION.tar.gz | tar xzf - --strip-components=1 -C build/rsem

RUN cd build/rsem && make

RUN apt-get remove -y gcc make build-essential zlib1g-dev libncurses-dev && \
    apt-get autoremove -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
