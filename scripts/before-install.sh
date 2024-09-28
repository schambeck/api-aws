#docker kill $(docker ps -q)
#docker rm $(docker ps -aq)
#docker rmi -f $(docker images -aq)

aws ecr get-login-password --region sa-east-1 | docker login --username AWS --password-stdin 593793055971.dkr.ecr.sa-east-1.amazonaws.com
docker pull 593793055971.dkr.ecr.sa-east-1.amazonaws.com/schambeck/api-aws:latest
