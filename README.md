# Azure DevOps runner in a container

This repository contains a Dockerfile to build a container image that can be used as a self-hosted agent in Azure DevOps.

## How to use

```bash
docker run --rm -ti ghcr.io/pablozaiden/azdo-runner-in-container:latest
```
Inside the container

```bash
./config.sh

# after the configuration is done, start the runner
./run.sh
```
