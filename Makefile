APP = api-aws
VERSION = 1.0.0
JAR = ${APP}-${VERSION}.jar
TARGET_JAR = target/${JAR}

DOCKER_IMAGE = ${APP}:latest
DOCKER_FOLDER = .
DOCKER_CONF = ${DOCKER_FOLDER}/Dockerfile
COMPOSE_CONF = ${DOCKER_FOLDER}/compose.yaml

# Maven

clean:
	./mvnw clean

dist-run: dist run

dist:
	./mvnw clean package -DskipTests=true -Dmaven.plugin.validation=BRIEF

run:
	java -jar ${TARGET_JAR}

check:
	../mvnw clean test -Dmaven.plugin.validation=BRIEF

# Compose

compose-down-up: compose-down compose-up

compose-down:
	docker compose down

compose-up:
	docker compose up -d

compose-up-postgres:
	docker compose up -d postgres

# Docker

dist-docker-build: dist docker-build

docker-build:
	docker build -f ${DOCKER_CONF} -t ${DOCKER_IMAGE} .

docker-run:
	docker run -d \
		--name ${APP} \
		--publish 8080:8080 \
		${DOCKER_IMAGE}
