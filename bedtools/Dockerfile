# Dockerfile for BEDtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

RUN filename=$(curl -sLI https://api.github.com/repos/arq5x/bedtools2/tarball | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    curl -o $filename -L https://api.github.com/repos/arq5x/bedtools2/tarball

RUN filename=$(curl -sLI https://api.github.com/repos/arq5x/bedtools2/tarball | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    mkdir $dirname && \
    tar xf $filename --strip-components=1 -C $dirname && \
    rm $filename

RUN filename=$(curl -sLI https://api.github.com/repos/arq5x/bedtools2/tarball | grep filename= | sed 's/.*filename=\(.*\)\r/\1/g') && \
    dirname=${filename%.tar.gz} && \
    cd $dirname && \
    make && \
    cp -p --update bin/* /usr/local/bin
