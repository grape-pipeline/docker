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

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y \
    libpng-dev libmysqlclient-dev libncurses-dev cmake python-pip

RUN pip install numpy

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

RUN filename=$(curl -sLI https://api.github.com/repos/arq5x/bedtools2/tarball/v$_BEDTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    curl -o $filename -L https://api.github.com/repos/arq5x/bedtools2/tarball/v$_BEDTOOLS_VERSION

RUN filename=$(curl -sLI https://api.github.com/repos/arq5x/bedtools2/tarball/v$_BEDTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    mkdir $dirname && \
    tar xf $filename --strip-components=1 -C $dirname && \
    rm $filename

RUN filename=$(curl -sLI https://api.github.com/repos/arq5x/bedtools2/tarball/v$_BEDTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    make && \
    cp -p --update bin/* /usr/local/bin

RUN filename=$(curl -sLI https://api.github.com/repos/pezmaster31/bamtools/tarball/v$_BAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    curl -o $filename -L https://api.github.com/repos/pezmaster31/bamtools/tarball/v$_BAMTOOLS_VERSION

RUN filename=$(curl -sLI https://api.github.com/repos/pezmaster31/bamtools/tarball/v$_BAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    mkdir $dirname && \
    tar xf $filename --strip-components=1 -C $dirname && \
    rm $filename

RUN filename=$(curl -sLI https://api.github.com/repos/pezmaster31/bamtools/tarball/v$_BAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    mkdir build && \
    cd build && \
    cmake ..

RUN filename=$(curl -sLI https://api.github.com/repos/pezmaster31/bamtools/tarball/v$_BAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    cd build && \
    make

RUN filename=$(curl -sLI https://api.github.com/repos/pezmaster31/bamtools/tarball/v$_BAMTOOLS_VERSION | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    cd build && \
    make install

RUN curl -O http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v$_KENTUTILS_VERSION.src.tgz && \
    tar xf userApps.v$_KENTUTILS_VERSION.src.tgz && \
    rm userApps.v$_KENTUTILS_VERSION.src.tgz

RUN cd userApps && \
    make libs && \
    cd kent/src && \
    make destBin && \
    cd utils && \
    make bedGraphToBigWig.userApps 
