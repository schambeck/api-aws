docker build -f /usr/src/app/Dockerfile /usr/src/app/ -t api-aws
docker run -d -p 8080:8080 api-aws
