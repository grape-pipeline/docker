# Dockerfile for GEMtools
#
# VERSION               0.1

FROM       grape/base
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _FLUX_VERSION 1.6.1

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u76-b13/jre-7u76-linux-x64.tar.gz && \
    tar xf jre-7u76-linux-x64.tar.gz && \
    update-alternatives --install /usr/bin/java java /jre1.7.0_76/bin/java 100

RUN curl -O http://artifactory.sammeth.net/artifactory/barna/barna/barna.capacitor/$_FLUX_VERSION/flux-capacitor-$_FLUX_VERSION.tgz

RUN tar xf flux-capacitor-1.6.1.tgz

ENV PATH $PATH:/flux-capacitor-1.6.1/bin

ENTRYPOINT ["flux-capacitor"]
CMD ["--help"]
