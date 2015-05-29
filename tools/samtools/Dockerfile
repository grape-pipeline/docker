# Dockerfile for SAMtools
#
# Tools
# -----
# SAMtools v0.1.19
#
FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _SAMTOOLS_VERSION 0.1.19

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    make \
    build-essential \
    zlib1g-dev \
    libncurses-dev

RUN mkdir -p build/samtools && curl -L https://api.github.com/repos/samtools/samtools/tarball/$_SAMTOOLS_VERSION | tar xzf - --strip-components=1 -C build/samtools

RUN cd build/samtools && make && cp -p --update samtools bcftools/bcftools /usr/local/bin

RUN apt-get remove -y gcc make build-essential zlib1g-dev libncurses-dev && \
    apt-get autoremove -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*