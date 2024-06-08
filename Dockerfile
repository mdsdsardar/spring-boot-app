# Stage 1: Build the application with Maven
FROM maven:3.8.1-openjdk-11-slim AS build

# Set the working directory for the build stage
WORKDIR /app

# Copy the pom.xml and the source code
COPY pom.xml ./
COPY src ./src

# Package the application using Maven
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM openjdk:11-jdk-slim

# Set the working directory for the runtime stage
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java","-jar","app.jar"]

