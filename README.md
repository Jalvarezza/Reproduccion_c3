# Reproducción — Microservicio de riesgo reproduccion

Microservicio correspondiente al **caso caso03 — StreamVerse** (Plataforma de streaming) de la Evaluación Parcial N°1.

| | |
|---|---|
| Stack | Spring Boot 3.3 · Java 21 · Maven · Spring Data JPA · H2 · springdoc-openapi |
| Calidad | JaCoCo cobertura LINE 100% · Cucumber (BDD) alineado a endpoints REST |
| Entrega | Docker / Docker Compose |

---

## 🚀 Estrategia DevOps y Gestión del Repositorio

### 1. Estrategia de Branching: GitFlow (IE1)
Se selecciona **GitFlow** como estrategia de control de versiones debido a que el proyecto requiere un ciclo de vida estructurado con aislamiento total de nuevas funcionalidades (`feature/`), integración continua activa (`develop`), entregas estables a producción (`main`) y resolución rápida de incidentes en producción (`hotfix/`) sin interferir con el desarrollo en marcha.

### 2. Convención de Ramas y Commits (IE5)
* **Naming de Ramas:**
  * `main`: Código estable de producción.
  * `develop`: Base para integración continua.
  * `feature/<nombre>`: Nuevas características (ej. `feature/add-logging`).
  * `hotfix/<nombre>`: Parches críticos desde main (ej. `hotfix/fix-null-pointer`).
* **Conventional Commits:** Formato obligatorio `<tipo>(<alcance>): <descripción>`
  * `feat`: Nuevas funcionalidades.
  * `fix`: Correcciones de errores.
  * `docs`: Cambios en documentación.
  * `chore`: Configuración o mantenimiento.

### 3. Flujo de Merge y Code Review (IE2)
* Ningún cambio entra directamente a `main` o `develop`.
* Todo cambio se integra mediante **Pull Request (PR)** requiriendo al menos 1 revisión/aprobación por un par.

---

## Responsabilidad (SRP)
Administra los datos y la lógica del dominio de Reproducción del caso caso03 (StreamVerse). Su base de datos es una **H2 en memoria** (un solo microservicio por base), cumpliendo aislamiento de datos por dominio.

## Página de presentación
Al ejecutar el servicio, `http://localhost:8080/` muestra la página de presentación del microservicio con documentación y enlaces a:
- **Swagger UI**: `/swagger-ui/index.html`
- **OpenAPI (yaml)**: `/v3/api-docs.yaml`
- **ReDoc**: `/redoc.html`
- **H2 Console**: `/h2-console`

## Endpoints
| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/api/reproducciones` | Lista todos los recursos |
| GET | `/api/reproducciones/{id}` | Obtiene un recurso por id |
| POST | `/api/reproducciones` | Crea un recurso |
| PUT | `/api/reproducciones/{id}` | Actualiza un recurso |
| DELETE | `/api/reproducciones/{id}` | Elimina un recurso |

## Documentación del proyecto
La documentación completa está en la carpeta [`docs/`](docs/):
- [`docs/00_Resumen.md`](docs/00_Resumen.md) — propósito, responsabilidad y tecnologías
- [`docs/01_Arquitectura.md`](docs/01_Arquitectura.md) — componentes, arquitectura y patrones
- [`docs/02_API.md`](docs/02_API.md) — contrato REST y ejemplos curl
- [`docs/03_Pruebas.md`](docs/03_Pruebas.md) — tests unitarios, cobertura y Cucumber
- [`docs/04_Despliegue.md`](docs/04_Despliegue.md)
- [`docs/05_Justificacion.md`](docs/05_Justificacion.md) — justificación del servicio
- [`docs/diagramas/`](docs/diagramas/) — C4, secuencia e infraestructura AWS

## Cómo ejecutar localmente
```bash
mvn spring-boot:run
<!-- prueba de comentario loggin added-->

<!-- Configuraci�n de registro de reproducciones agregada -->

<!-- Configuraci�n de registro de reproducciones agregada -->
