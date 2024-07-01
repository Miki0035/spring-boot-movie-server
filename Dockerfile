
# Use an official OpenJDK image to run the application
FROM openjdk:17-slim AS build
COPY . .
RUN chmod + x ./mvnw clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/movies-0.0.1-SNAPSHOT.jar movies.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "movies.jar"]
