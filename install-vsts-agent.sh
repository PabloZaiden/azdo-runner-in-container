#!/usr/bin/env bash

# Install the VSTS agent
mkdir ./agent
cd agent

version="4.248.0"
architecture=$(uname -m)
if [ "$architecture" == "aarch64" ]; then
    architecture="arm64"
fi

wget https://vstsagentpackage.azureedge.net/agent/$version/pipelines-agent-linux-$architecture-$version.tar.gz
tar zxvf ./pipelines-agent-linux-$architecture-$version.tar.gz
