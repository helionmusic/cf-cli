FROM ubuntu:xenial
MAINTAINER Helion Music (https://www.github.com/helionmusic)

# Install base packages
RUN apt-get update && apt-get -y install \
        curl \
        dnsutils \
        git \
        jq \
        unzip \
        apt-transport-https \
        ca-certificates \
        wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list

RUN apt-get update && apt-get -y install cf-cli
