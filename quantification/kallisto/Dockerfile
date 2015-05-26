# Dockerfile for GRAPE quantification steps
#
# Tools
# -----
# kallisto  v0.42.1
#
FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _KALLISTO_VERSION 0.42.1

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake \
    gcc \
    make \
    build-essential \
    zlib1g-dev \
    libhdf5-dev \
    pigz

RUN mkdir -p build/kallisto && curl -L https://api.github.com/repos/pachterlab/kallisto/tarball/v$_KALLISTO_VERSION | tar xz --strip-components=1 -C build/kallisto

RUN mkdir -p build/kallisto/build && cd build/kallisto/build && cmake .. && make && make install

RUN apt-get remove -y perl gcc make build-essential cmake python-dev libncurses-dev libpng-dev libmysqlclient-dev && \
    apt-get autoremove -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* build
