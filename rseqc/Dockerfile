# Dockerfile for RSeQC
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _RSEQC_VERSION 2.3.9

RUN pip install cython numpy pysam

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
    python setup.py install 

RUN rm -rf /usr/local/lib/python2.7/dist-packages/RSeQC-$_RSEQC_VERSION-py2.7-linux-x86_64.egg/pysam && \
    ln -s /usr/local/lib/python2.7/dist-packages/pysam /usr/local/lib/python2.7/dist-packages/RSeQC-$_RSEQC_VERSION-py2.7-linux-x86_64.egg/pysam
