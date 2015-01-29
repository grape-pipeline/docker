# Dockerfile for GRAPE mapping step
#
# Tools
# -----
# GEMtools  v1.7.1
# SAMtools  v0.1.19

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com

ENV _GEMTOOLS_VERSION 1.7.1
ENV _SAMTOOLS_VERSION 0.1.19

ENV PATH /usr/local/lib/python2.7/dist-packages/gem/gembinaries/:$PATH

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libbz2-dev pigz libncurses-dev

RUN filename=$(curl -sLI https://api.github.com/repos/gemtools/gemtools/tarball/v$_GEMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    curl -o $filename -L https://api.github.com/repos/gemtools/gemtools/tarball/v$_GEMTOOLS_VERSION

RUN filename=$(curl -sLI https://api.github.com/repos/gemtools/gemtools/tarball/v$_GEMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    mkdir $dirname && \
    tar xf $filename --strip-components=1 -C $dirname && \
    rm $filename

RUN filename=$(curl -sLI https://api.github.com/repos/gemtools/gemtools/tarball/v$_GEMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    python setup.py install

RUN filename=$(curl -sLI https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    curl -o $filename -L https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION

RUN filename=$(curl -sLI https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    mkdir $dirname && \
    tar xf $filename --strip-components=1 -C $dirname && \
    rm $filename

RUN filename=$(curl -sLI https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    make

RUN filename=$(curl -sLI https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    cp -p --update samtools bcftools/bcftools /usr/local/bin
