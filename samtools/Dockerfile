# Dockerfile for BEDtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _SAMTOOLS_VERSION 0.1.19

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libncurses-dev

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

ENTRYPOINT ["samtools"]
