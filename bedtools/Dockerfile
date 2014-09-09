# Dockerfile for BEDtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

RUN wget -q https://github.com/arq5x/bedtools2/releases/download/v{{ version }}/bedtools-{{ version }}.tar.gz

RUN mkdir bedtools-{{ version }} && \
    tar xf bedtools-{{ version }}.tar.gz --strip-components=1 -C bedtools-{{ version }} && \
    rm bedtools-{{ version }}.tar.gz

RUN cd bedtools-{{ version }} && \
    make && \
    cp -p --update bin/* /usr/local/bin

ENTRYPOINT ["bedtools"]
CMD ["--help"]
