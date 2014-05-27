# Dockerfile for Gemtools 
#
# VERSION               0.1

FROM       debian:latest
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --fix-missing

RUN apt-get install -y \ 
    gcc \
    make \
    build-essential \
    git \
    python-dev \
    python-pip \
    locales \
    wget

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure -f noninteractive locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8

RUN pip install --upgrade distribute
