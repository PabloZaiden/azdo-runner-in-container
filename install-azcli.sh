#!/usr/bin/env bash

set -e

echo "Installing Azure CLI prerequisites..."
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

echo "Creating keyring..."
sudo mkdir -p /etc/apt/keyrings
echo "Downloading Microsoft GPG key..."
curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
echo "Setting permissions..."
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_DIST=$(lsb_release -cs)
echo "AZ_DIST: ${AZ_DIST}"

echo "Adding Azure CLI repository..."
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

echo "Contents of /etc/apt/sources.list.d/azure-cli.sources:"
cat /etc/apt/sources.list.d/azure-cli.sources

echo "Updating package cache..."
sudo apt-get update

echo "Installing Azure CLI..."
sudo apt-get install azure-cli