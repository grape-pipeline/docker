# Dockerfile for GRAPE inferex step
#
# Tools
# -----
# RSeQC       v2.3.9
# KentUtils   v308

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _RSEQC_VERSION 2.3.9
ENV _KENTUTILS_VERSION 308

ENV PATH /userApps/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev \
    libmysqlclient-dev \
    python-pip \
    python-dev \
    gcc \
    make \
    build-essential

RUN pip install numpy pysam

RUN mkdir -p build/rseqc && curl -L http://sourceforge.net/projects/rseqc/files/RSeQC-$_RSEQC_VERSION.tar.gz/download | tar xzf - --strip-components=1 -C build/rseqc

RUN cd build/rseqc && python setup.py install

RUN rm -rf /usr/local/lib/python2.7/dist-packages/RSeQC-$_RSEQC_VERSION-py2.7-linux-x86_64.egg/pysam && \
    ln -s /usr/local/lib/python2.7/dist-packages/pysam /usr/local/lib/python2.7/dist-packages/RSeQC-$_RSEQC_VERSION-py2.7-linux-x86_64.egg/pysam

RUN curl http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v$_KENTUTILS_VERSION.src.tgz | tar xzf - -C build

RUN cd build/userApps && make libs && \
    cd kent/src && make destBin && \
    cd hg && make genePredToBed.userApp && \
    cd utils && make gtfToGenePred.userApp

RUN apt-get remove -y perl gcc make build-essential cmake python-dev libpng-dev libmysqlclient-dev && \
    apt-get autoremove -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* build
