# Dockerfile for GRAPE quantification step
#
# Tools
# -----
# JavaRE        v1.7.0_76
# FluxCapacitor v1.6.1

FROM       grape/samtools:0.1.19
MAINTAINER Emilio Palumbo <emiliopalumbo@gmail.com>

ENV _JAVA_VERSION 1.7.0_76
ENV _FLUX_VERSION 1.6.1

ENV PATH $PATH:/flux-capacitor-1.6.1/bin

RUN curl --header "Cookie: oraclelicense=accept-securebackup-cookie" -L http://download.oracle.com/otn-pub/java/jdk/7u76-b13/jre-7u76-linux-x64.tar.gz | tar xzf - && \
    update-alternatives --install /usr/bin/java java /jre1.7.0_76/bin/java 100

RUN curl http://artifactory.sammeth.net/artifactory/barna/barna/barna.capacitor/$_FLUX_VERSION/flux-capacitor-$_FLUX_VERSION.tgz | tar xzf -
