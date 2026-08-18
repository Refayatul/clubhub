# Stage 1: Build the JAR with Maven & Java 21
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Runtime image
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

RUN useradd -m -u 1000 user && mkdir -p /app/uploads && chown -R user:user /app
USER user

COPY --from=build --chown=user:user /app/target/*.jar app.jar

EXPOSE 8080
ENV PORT=8080

ENTRYPOINT ["java", "-Xmx400m", "-jar", "app.jar"]
