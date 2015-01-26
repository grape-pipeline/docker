# Dockerfile for GEMtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _KENTUTILS_VERSION 308

RUN DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing && \
    apt-get install -y \
    unzip libpng-dev libmysqlclient-dev

RUN curl -O http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v$_KENTUTILS_VERSION.src.tgz && \
    tar xf userApps.v$_KENTUTILS_VERSION.src.tgz

RUN cd userApps && \
    make libs utils && \
    cp -p --update bin/* /usr/local/bin
