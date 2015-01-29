# Dockerfile for GRAPE inferex step
#
# Tools
# -----
# RSeQC       v2.3.9
# KentUtils  v308

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _RSEQC_VERSION 2.3.9
ENV _KENTUTILS_VERSION 308

ENV PATH /userApps/bin:$PATH

RUN DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing && \
    apt-get install -y \
    unzip libpng-dev libmysqlclient-dev

RUN pip install numpy pysam

RUN filename=RSeQC-$_RSEQC_VERSION.tar.gz && \
    curl -o $filename -L http://sourceforge.net/projects/rseqc/files/$filename/download

RUN filename=RSeQC-$_RSEQC_VERSION.tar.gz && \
    dirname=${filename%.tar.gz} && \
    mkdir $dirname && \
    tar xf $filename --strip-components=1 -C $dirname && \
    rm $filename

RUN filename=RSeQC-$_RSEQC_VERSION.tar.gz && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    python setup.py install && \
    rm -rf $dirname

RUN rm -rf /usr/local/lib/python2.7/dist-packages/RSeQC-$_RSEQC_VERSION-py2.7-linux-x86_64.egg/pysam && \
    ln -s /usr/local/lib/python2.7/dist-packages/pysam /usr/local/lib/python2.7/dist-packages/RSeQC-$_RSEQC_VERSION-py2.7-linux-x86_64.egg/pysam

RUN curl -O http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v$_KENTUTILS_VERSION.src.tgz && \
    tar xf userApps.v$_KENTUTILS_VERSION.src.tgz && \
    rm userApps.v$_KENTUTILS_VERSION.src.tgz

RUN cd userApps && \
    make libs && \
    cd kent/src && \
    make destBin
    
RUN cd userApps/kent/src/hg && \
    make genePredToBed.userApp && \
    cd utils && \
    make gtfToGenePred.userApp
