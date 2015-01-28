# Dockerfile for GEMtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _KENTUTILS_VERSION 308
ENV PATH /userApps/bin:$PATH

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y \
    unzip libpng-dev libmysqlclient-dev

RUN curl -O http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v$_KENTUTILS_VERSION.src.tgz && \
    tar xf userApps.v$_KENTUTILS_VERSION.src.tgz && \
    rm userApps.v$_KENTUTILS_VERSION.src.tgz

RUN cd userApps/kent/src && \
    make libs userApps BINDIR=/userApps/bin
