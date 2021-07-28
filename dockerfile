FROM openjdk:11-jdk-slim AS build-env
ADD . /app/examples
WORKDIR /app
CMD ["java -jar main.jar"]
