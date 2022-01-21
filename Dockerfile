FROM ubuntu:focal
ARG OS=linux
ARG ARCH=amd64
ARG JAVA_VER=java11
ARG MANDREL_VER=21.3.0.0-Final
ARG MANDREL_SLUG=mandrel-$JAVA_VER-$OS-$ARCH-$MANDREL_VER
ARG MANDREL_SLUG_SHORT=mandrel-$JAVA_VER-$MANDREL_VER

RUN apt-get update \
    && apt-get install -y wget gcc zlib1g-dev build-essential g++ zlib1g-dev libfreetype6-dev
RUN mkdir /usr/lib/jvm
RUN wget https://github.com/graalvm/mandrel/releases/download/mandrel-$MANDREL_VER/$MANDREL_SLUG.tar.gz -P /tmp && tar -xvzf /tmp/$MANDREL_SLUG.tar.gz -C /usr/lib/jvm
ENV PATH /usr/lib/jvm/$MANDREL_SLUG_SHORT/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/$MANDREL_SLUG_SHORT
ENV MANDREL_HOME /usr/lib/jvm/$MANDREL_SLUG_SHORT