FROM openjdk:11-jdk-slim AS build-env
ADD . /app/examples
WORKDIR /app/examples/target
RUN java -jar my-app-1.0-SNAPSHOT.jar
