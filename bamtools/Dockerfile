# Dockerfile for BAMtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _BAMTOOLS_VERSION 2.3.0
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib/bamtools

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y \
    cmake

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

ENTRYPOINT ["bamtools"]
