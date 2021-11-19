
# this confirm the latest version of docker

docker_present_version=($(docker -v))
version_number=${docker_present_version[2]%?}

docker_latest_version="$(apt list docker-ce)"

echo "$version_number"

echo "$docker_latest_version"

if [[ $docker_latest_version == *$version_number* ]]
then
    echo "It is the string!"
else
    echo "It's not him!"
fi
