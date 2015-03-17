# Dockerfile for GRAPE mapping step
#
# Tools
# -----
# GEMtools  v1.7.1
# SAMtools  v0.1.19
#
FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _GEMTOOLS_VERSION 1.7.1
ENV _SAMTOOLS_VERSION 0.1.19

ENV PATH /usr/local/lib/python2.7/dist-packages/gem/gembinaries/:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    make \
    build-essential \
    python-dev \
    python-pip \
    pigz \
    libbz2-dev \
    libncurses-dev

RUN touch /tmp/.hold && mkdir -p build/gemtools && curl -L https://api.github.com/repos/gemtools/gemtools/tarball/v$_GEMTOOLS_VERSION | tar xzf - --strip-components=1 -C build/gemtools 

RUN cd build/gemtools && python setup.py install

RUN mkdir -p build/samtools && curl -L https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION | tar xzf - --strip-components=1 -C build/samtools

RUN cd build/samtools && make && cp -p --update samtools bcftools/bcftools /usr/local/bin

RUN apt-get remove -y perl gcc make build-essential python-dev libbz2-dev libncurses-dev && \
    apt-get autoremove -y 

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* build  
