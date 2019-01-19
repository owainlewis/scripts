#!/usr/bin/env bash

# Remove old packages
apt-get remove -y docker docker-engine docker.io containerd runc

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update && apt-get install -y docker-ce

# Enable docker without sudo
sudo usermod -a -G docker $USER
