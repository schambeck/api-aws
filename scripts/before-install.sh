docker kill $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
