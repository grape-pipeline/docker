# Dockerfile for GRAPE quantification step
#
# Tools
# -----
# RSEM  v1.2.15
#
FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _RSEM_VERSION 1.2.15
ENV _SAMTOOLS_VERSION 1.2
ENV PATH /build/rsem:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    make \
    build-essential \
    zlib1g-dev \
    libncurses-dev \
    r-base

RUN mkdir -p build/samtools && curl -L https://github.com/samtools/samtools/releases/download/1.2/samtools-$_SAMTOOLS_VERSION.tar.bz2 | tar xj --strip-components=1 -C build/samtools 

RUN cd build/samtools && make && cp -p --update samtools /usr/local/bin

RUN mkdir -p build/rsem && curl -L http://deweylab.biostat.wisc.edu/rsem/src/rsem-$_RSEM_VERSION.tar.gz | tar xzf - --strip-components=1 -C build/rsem

RUN cd build/rsem && make

RUN apt-get remove -y gcc make build-essential zlib1g-dev libncurses-dev && \
    apt-get autoremove -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
