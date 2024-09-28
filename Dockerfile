FROM amazoncorretto:17-alpine-jdk
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
ENTRYPOINT ["java", "-jar", "api-aws*.jar"]
