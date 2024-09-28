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
RUN java -Djarmode=layertools -jar api-aws*.jar extract

FROM amazoncorretto:17-alpine-jdk
ARG TARGET=/workspace/app/api-aws/target
COPY --from=build ${TARGET}/dependencies/ ./
COPY --from=build ${TARGET}/snapshot-dependencies/ ./
COPY --from=build ${TARGET}/spring-boot-loader/ ./
COPY --from=build ${TARGET}/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]
