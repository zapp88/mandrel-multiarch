FROM ubuntu:focal
ARG OS=linux
ARG TARGETPLATFORM
RUN echo $TARGETPLATFORM
ARG JAVA_VER=java11
ARG GRAALVM_VER=21.3.0
ARG GRAALVM_SLUG=graalvm-ce-$JAVA_VER-$OS-${ARCH}-$GRAALVM_VER
ARG GRAALVM_SLUG_SHORT=graalvm-ce-$JAVA_VER-$GRAALVM_VER

RUN apt-get update \
    && apt-get install -y wget gcc zlib1g-dev build-essential
RUN mkdir /usr/lib/jvm
RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-$GRAALVM_VER/$GRAALVM_SLUG.tar.gz -P /tmp && tar -xvzf /tmp/$GRAALVM_SLUG.tar.gz -C /usr/lib/jvm
ENV PATH /usr/lib/jvm/$GRAALVM_SLUG_SHORT/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/$GRAALVM_SLUG_SHORT
ENV GRAALVM_HOME /usr/lib/jvm/$GRAALVM_SLUG_SHORT
RUN ${GRAALVM_HOME}/bin/gu install native-image