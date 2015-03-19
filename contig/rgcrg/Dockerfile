# Dockerfile for GRAPE contig/bigwig steps
#
# Tools
# -----
# SAMtools  v0.1.19
# BEDtools  v2.19.1
# BAMtools  v2.3.0
# KentUtils v308

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _SAMTOOLS_VERSION 0.1.19
ENV _BEDTOOLS_VERSION 2.19.1
ENV _BAMTOOLS_VERSION 2.3.0
ENV _KENTUTILS_VERSION 308

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib/bamtools
ENV PATH /userApps/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev \
    libmysqlclient-dev \
    libncurses-dev \
    cmake \
    python-pip \
    python-dev \
    gcc \
    make \
    build-essential \
    pigz

RUN pip install numpy

RUN mkdir -p build/samtools && curl -L https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION | tar xzf - --strip-components=1 -C build/samtools

RUN cd build/samtools && make && cp -p --update samtools bcftools/bcftools /usr/local/bin

RUN mkdir -p build/bedtools && curl -L https://api.github.com/repos/arq5x/bedtools2/tarball/v$_BEDTOOLS_VERSION | tar xzf - --strip-components=1 -C build/bedtools

RUN cd build/bedtools && make && cp -p --update bin/* /usr/local/bin

RUN mkdir -p build/bamtools && curl -L https://api.github.com/repos/pezmaster31/bamtools/tarball/v$_BAMTOOLS_VERSION | tar xzf - --strip-components=1 -C build/bamtools

RUN cd build/bamtools && mkdir build && cd build && cmake .. 
RUN cd build/bamtools/build && make && make install

RUN curl http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v$_KENTUTILS_VERSION.src.tgz | tar xzf - -C build

RUN cd build/userApps && make libs && cd kent/src && make destBin && cd utils && make bedGraphToBigWig.userApps 

RUN apt-get remove -y perl gcc make build-essential cmake python-dev libncurses-dev libpng-dev libmysqlclient-dev && \
    apt-get autoremove -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* build
