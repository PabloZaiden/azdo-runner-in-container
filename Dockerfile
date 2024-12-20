FROM ubuntu:24.04

RUN apt update && \
    apt install -y git curl wget sudo libicu-dev

RUN useradd -m -s /bin/bash runner && \
    echo 'runner ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER runner

RUN mkdir -p /home/runner && \
    chown runner:runner /home/runner
WORKDIR /home/runner

ENV DEBIAN_FRONTEND=noninteractive

ADD install-azcli.sh /home/runner/install-azcli.sh
RUN ./install-azcli.sh

ADD install-vsts-agent.sh /home/runner/install-vsts-agent.sh
RUN ./install-vsts-agent.sh

WORKDIR /home/runner/agent