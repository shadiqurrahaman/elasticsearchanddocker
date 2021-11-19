#!/bin/bash
#Check if Docker is installed or not

if [ -x "$(command -v docker)" ]; then
    docker_present_version=($(docker -v))
    version_number=${docker_present_version[2]%?}
    docker_latest_version="$(apt list docker-ce)"
    if [[ $docker_latest_version != *$version_number* ]]
    then
        echo "Removing Docker Dersion"
        #apt-get remove docker docker-engine docker.io containerd runc
        sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
        echo "installing Docker"
        
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
	sudo apt install docker-ce
	docker run hello-world

    else
    
        echo "Docker version is up to date"
    fi
    
else
    echo "installing Docker"

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
    sudo apt install docker-ce
    docker run hello-world
fi
