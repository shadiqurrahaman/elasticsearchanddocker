#!/bin/bash
#Chec

if [ -x "$(command -v docker)" ]; then
    echo "Removing Docker old Version"
    # command
    
#    apt-get remove docker docker-engine docker.io containerd runc
    apt-get update
    
#else
 #   echo "Install docker"
    # command
    #python3 --version
fi

echo "Installing Docker ...."
apt-get update
echo "-------------------------------------------------1"
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
echo "-------------------------------------------------2"
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable nightly" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install docker-ce docker-ce-cli containerd.io

apt-cache madison docker-ce
