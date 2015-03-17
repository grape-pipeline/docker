# Dockerfile for the GRAPE base container
#
FROM       debian:latest
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      locales \
      curl \
      gawk \
      pigz

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure -f noninteractive locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8

RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /usr/share/locale/* /var/lib/apt/* /var/lib/cache/* /var/lib/log/* /tmp/* /var/tmp/*  
