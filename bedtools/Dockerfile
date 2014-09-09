# Dockerfile for BEDtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

RUN wget -q https://github.com/arq5x/bedtools2/releases/download/v2.20.1/bedtools-2.20.1.tar.gz

RUN mkdir bedtools-2.20.1 && \
    tar xf bedtools-2.20.1.tar.gz --strip-components=1 -C bedtools-2.20.1 && \
    rm bedtools-2.20.1.tar.gz

RUN cd bedtools-2.20.1 && \
    make && \
    cp -p --update bin/* /usr/local/bin

ENTRYPOINT ["bedtools"]
CMD ["--help"]
