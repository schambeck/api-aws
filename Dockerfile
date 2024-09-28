FROM amazoncorretto:17-alpine-jdk AS build
WORKDIR /workspace/app

COPY mvnw .
RUN chmod +x ./mvnw
COPY .mvn .mvn
COPY pom.xml .
COPY src api-aws/src
COPY pom.xml api-aws
WORKDIR /workspace/app/api-aws
RUN ../mvnw package -DskipTests
WORKDIR /workspace/app/api-aws/target

FROM amazoncorretto:17-alpine-jdk
ARG TARGET=/workspace/app/api-aws/target
COPY --from=build ${TARGET}/api-aws*.jar ./
ENTRYPOINT ["java", "-jar", "api-aws-1.0.0.jar"]
