
# Use an official OpenJDK image to run the application
FROM maven:3.8.5-openjdk-17-jdk AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/movies-0.0.1-SNAPSHOT.jar movies.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "movies.jar"]
