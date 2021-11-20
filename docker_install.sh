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
        apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
        echo "installing Docker"
        source docker_install_process.sh 
        install_docker
        
    else
    
        echo "Docker version is up to date"
    fi
    
else
    echo "installing Docker"
    
    source docker_install_process.sh 
    install_docker
fi

#docker network create elastic
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.12.0
docker pull docker.elastic.co/kibana/kibana:7.12.0


