FROM ubuntu:focal
ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ] ; then export ARCH="amd64" ; fi
RUN if [ "$TARGETPLATFORM" = "linux/arm64" ] ; then export ARCH="aarch64" ; fi
RUN echo $ARCH
ENV OS=linux
ENV JAVA_VER=java11
ENV GRAALVM_VER=21.3.0
ENV GRAALVM_SLUG=graalvm-ce-${JAVA_VER}-${OS}-${ARCH}-${GRAALVM_VER}
ENV GRAALVM_SLUG_SHORT=graalvm-ce-${JAVA_VER}-${GRAALVM_VER}

RUN apt-get update \
    && apt-get install -y wget gcc zlib1g-dev build-essential
RUN mkdir /usr/lib/jvm
RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VER}/${GRAALVM_SLUG}.tar.gz -P /tmp && tar -xvzf /tmp/${GRAALVM_SLUG}.tar.gz -C /usr/lib/jvm
ENV PATH /usr/lib/jvm/${GRAALVM_SLUG_SHORT}/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/${GRAALVM_SLUG_SHORT}
ENV GRAALVM_HOME /usr/lib/jvm/${GRAALVM_SLUG_SHORT}
RUN ${GRAALVM_HOME}/bin/gu install native-image