# Stage 1: Build (optional - skip if you build JAR locally)
# FROM maven:3.9.6-eclipse-temurin-17 AS build
# WORKDIR /app
# COPY . .
# RUN mvn clean package -DskipTests

# Stage 2: Run
FROM openjdk:17-jdk-slim

# Create a non-root user (optional but best practice)
RUN useradd -ms /bin/bash appuser

WORKDIR /app

# Copy JAR (if you build it locally)
COPY target/*.jar app.jar

# Or, if using build stage above:
# COPY --from=build /app/target/*.jar app.jar

# Use non-root user
USER appuser

# Expose port (optional)
EXPOSE 8080

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
