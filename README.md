# Reproduccion de un Microservicio de riesgo reproduccion

Microservicio correspondiente al **caso caso03 â€” StreamVerse** (Plataforma de streaming) de la Evaluacion Parcial N°1.

| | |
|---|---|
| Stack | Spring Boot 3.3 Â· Java 21 Â· Maven Â· Spring Data JPA Â· H2 Â· springdoc-openapi |
| Calidad | JaCoCo cobertura LINE 100% Â· Cucumber (BDD) alineado a endpoints REST |
| Entrega | Docker / Docker Compose |

## Responsabilidad (SRP)

administra los datos y la logica del dominio de Reproduccion del caso caso03 (StreamVerse). Su base de datos es una **H2 en memoria** (un solo microservicio por base), cumpliendo aislamiento de datos por dominio.

## Pagina de presentacion

Al ejecutar el servicio, `http://localhost:8080/` muestra la pagina de presentacion del microservicio con documentacion y enlaces a:

- **Swagger UI**: `/swagger-ui/index.html`
- **OpenAPI (yaml)**: `/v3/api-docs.yaml`
- **ReDoc**: `/redoc.html`
- **H2 Console**: `/h2-console`

## Endpoints

| Metodo | Ruta | Descripcion |
|--------|------|-------------|
| GET | `/api/reproducciones` | Lista todos los recursos |
| GET | `/api/reproducciones/{id}` | Obtiene un recurso por id |
| POST | `/api/reproducciones` | Crea un recurso |
| PUT | `/api/reproducciones/{id}` | Actualiza un recurso |
| DELETE | `/api/reproducciones/{id}` | Elimina un recurso |

##  Estrategia DevOps y Flujo de Trabajo

### 1. Modelo de Ramificación: GitFlow
Adoptamos el modelo **GitFlow** para asegurar un desarrollo ordenado y predictible. Esto nos permite construir nuevas funcionalidades en aislamiento (`feature/`), mantener un entorno de integración continua siempre activo (`develop`), proteger las versiones estables destinadas a producción (`main`) y aplicar correcciones de emergencia (`hotfix/`) sin interferir con el trabajo diario.

### 2. Convención para Ramas y Commits
* **Organización de Ramas:**
  * `main`: Producción y versiones estables.
  * `develop`: Integración continua de nuevas características.
  * `feature/<funcionalidad>`: Desarrollo de cambios específicos (ej. `feature/add-metrics`).
  * `hotfix/<incidencia>`: Correcciones críticas desde main (ej. `hotfix/fix-null-pointer`).
* **Mensajes de Commit (Standard Conventional Commits):**
  Usamos el formato `<tipo>(<alcance>): <descripción>`
  * `feat`: Nuevas características.
  * `fix`: Corrección de errores.
  * `docs`: Documentación.
  * `chore`: Mantenimiento y configuración del proyecto.

### 3. Flujo de Integración y Revisión de Código
* Ninguna modificación se aplica directamente sobre las ramas principales (`main` o `develop`).
* Todo cambio debe ingresar obligatoriamente mediante un **Pull Request (PR)**, el cual ejecuta las pruebas automáticas en GitHub-Actions antes de ser aprobado y fusionado.

---

## Documentacion del proyecto

La documentacion completa esta en la carpeta [`docs/`](docs/):

- [`docs/00_Resumen.md`](docs/00_Resumen.md) El proposito, responsabilidad y tecnologias
- [`docs/01_Arquitectura.md`](docs/01_Arquitectura.md) Los componentes, arquitectura y patrones
- [`docs/02_API.md`](docs/02_API.md)  contrato REST y ejemplos curl
- [`docs/03_Pruebas.md`](docs/03_Pruebas.md) Los tests unitarios, cobertura y Cucumber
- [`docs/04_Despliegue.md`](docs/04_Despliegue.md)
- [`docs/05_Justificacion.md`](docs/05_Justificacion.md) La justificacion del servicio: RF/RNF/seguridad cubiertos, stack y por que de cada tecnologia AWS
- [`docs/diagramas/`](docs/diagramas/)  C4 (contexto, contenedores, componentes), secuencia e infraestructura AWS â€” Docker, Docker Compose e integraciÃ³n

## Como ejecutar localmente
```bash
mvn spring-boot:run
```

## Como ejecutar con Docker

```bash
docker compose up --build
# http://localhost:8080
```

## Como ejecutar las pruebas

```bash
mvn test      # unit tests + Cucumber
mvn verify    # + verificaciÃ³n de cobertura JaCoCo (100% LINE, falla si baja)
```

<!-- Historial de integración: Registro de auditoría, trazabilidad de cambios y parches aplicados -->
