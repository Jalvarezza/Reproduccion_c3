# 1. Stage de Build: usamos Alpine para mantener liviano el contexto
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app

# Descargar dependencias primero para acelerar builds
COPY pom.xml ./
RUN mvn -B dependency:go-offline

# Aprovechamos la cache de Docker bajando primero las dependencias
COPY src ./src
RUN mvn -B package -DskipTests

# 2. Stage de Runtime: JRE ligero para ejecucion
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Seteamos un usuario sin privilegios por temas de seguridad/hardened container
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Traemos el jar exacto desde el stage anterior
COPY --from=build /app/target/reproduccion-svc-1.0.0.jar app.jar

# Permisos para el usuario no-root (SEGURIDAD)
RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 8080
# Flags JVM para optimizar uso de RAM dentro del contenedor
ENTRYPOINT ["java", "-XX:+UseG1GC", "-XX:MaxRAMPercentage=75.0", "-jar", "app.jar"]