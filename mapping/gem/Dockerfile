# Dockerfile for GRAPE mapping step
#
# Tools
# -----
# GEMtools  v1.7.1
# SAMtools  v0.1.19
#
FROM       grape/base:squash
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

RUN touch /tmp/.hold && mkdir build && curl -L https://api.github.com/repos/gemtools/gemtools/tarball/v$_GEMTOOLS_VERSION | tar xzf - -C build 

RUN cd $(find build -type d -name 'gemtools*') && python setup.py install

RUN curl -L https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION | tar xzf - -C build

RUN cd $(find build -type d -name 'samtools*') && make && cp -p --update samtools bcftools/bcftools /usr/local/bin

RUN apt-get remove -y perl gcc make build-essential python-dev libbz2-dev libncurses-dev && \
    apt-get autoremove -y 

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* build  
