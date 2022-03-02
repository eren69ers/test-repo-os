####
# This Dockerfile is used in order to build a container that runs the Spring Boot application
#
# Build the image with:
#
# docker build -f docker/Dockerfile -t springboot/sample-demo .
#
# Then run the container using:
#
# docker run -i --rm -p 8081:8081 springboot/sample-demo
####
FROM maven:3.8.1-openjdk-17-slim

WORKDIR /build

# Build dependency offline to streamline build
COPY ../pom.xml .
RUN mvn dependency:go-offline

COPY ../src src
RUN mvn package -Dmaven.test.skip=true

FROM openjdk:11-jdk
COPY --from=0 /build/target/openshift-demo-1.0.0.jar /app/target/openshift-demo-1.0.0.jar

EXPOSE 8081
ENTRYPOINT [ "java", "-jar", "/app/target/openshift-demo-1.0.0.jar", "--server.port=8081" ]