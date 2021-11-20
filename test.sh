
# this confirm the latest version of docker

#docker_present_version=($(docker -v))
#version_number=${docker_present_version[2]%?}

#docker_latest_version="$(apt list docker-ce)"

#echo "$version_number"

#echo "$docker_latest_version"

#if [[ $docker_latest_version == *$version_number* ]]
#then
#    echo "It is the string!"
#else
#    echo "It's not him!"
#fi

docker network create elastic
docker run -d --name es01-test --net elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.12.0

docker run -d --network=elastic --name kib1 -p 5601:5601 -e "ELASTICSEARCH_HOSTS=http://es01-test:9200" docker.elastic.co/kibana/kibana:7.12.0

