# Dockerfile for GEMtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libbz2-dev

RUN git clone https://github.com/gemtools/gemtools

RUN cd gemtools && \
    git checkout v1.7.1

RUN cd gemtools && \
    python setup.py install

ENTRYPOINT ["gemtools"]
CMD ["--help"]
