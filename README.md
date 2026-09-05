# ReproducciÃ³n â€” Microservicio de riesgo reproduccion

Microservicio correspondiente al **caso caso03 â€” StreamVerse** (Plataforma de streaming) de la EvaluaciÃ³n Parcial NÂ°1.

| | |
|---|---|
| Stack | Spring Boot 3.3 Â· Java 21 Â· Maven Â· Spring Data JPA Â· H2 Â· springdoc-openapi |
| Calidad | JaCoCo cobertura LINE 100% Â· Cucumber (BDD) alineado a endpoints REST |
| Entrega | Docker / Docker Compose |

---

## ðŸš€ Estrategia DevOps y GestiÃ³n del Repositorio

### 1. Estrategia de Branching: GitFlow (IE1)
Se selecciona **GitFlow** como estrategia de control de versiones debido a que el proyecto requiere un ciclo de vida estructurado con aislamiento total de nuevas funcionalidades (`feature/`), integraciÃ³n continua activa (`develop`), entregas estables a producciÃ³n (`main`) y resoluciÃ³n rÃ¡pida de incidentes en producciÃ³n (`hotfix/`) sin interferir con el desarrollo en marcha.

### 2. ConvenciÃ³n de Ramas y Commits (IE5)
* **Naming de Ramas:**
  * `main`: CÃ³digo estable de producciÃ³n.
  * `develop`: Base para integraciÃ³n continua.
  * `feature/<nombre>`: Nuevas caracterÃ­sticas (ej. `feature/add-logging`).
  * `hotfix/<nombre>`: Parches crÃ­ticos desde main (ej. `hotfix/fix-null-pointer`).
* **Conventional Commits:** Formato obligatorio `<tipo>(<alcance>): <descripciÃ³n>`
  * `feat`: Nuevas funcionalidades.
  * `fix`: Correcciones de errores.
  * `docs`: Cambios en documentaciÃ³n.
  * `chore`: ConfiguraciÃ³n o mantenimiento.

### 3. Flujo de Merge y Code Review (IE2)
* NingÃºn cambio entra directamente a `main` o `develop`.
* Todo cambio se integra mediante **Pull Request (PR)** requiriendo al menos 1 revisiÃ³n/aprobaciÃ³n por un par.

---

## Responsabilidad (SRP)
Administra los datos y la lÃ³gica del dominio de ReproducciÃ³n del caso caso03 (StreamVerse). Su base de datos es una **H2 en memoria** (un solo microservicio por base), cumpliendo aislamiento de datos por dominio.

## PÃ¡gina de presentaciÃ³n
Al ejecutar el servicio, `http://localhost:8080/` muestra la pÃ¡gina de presentaciÃ³n del microservicio con documentaciÃ³n y enlaces a:
- **Swagger UI**: `/swagger-ui/index.html`
- **OpenAPI (yaml)**: `/v3/api-docs.yaml`
- **ReDoc**: `/redoc.html`
- **H2 Console**: `/h2-console`

## Endpoints
| MÃ©todo | Ruta | DescripciÃ³n |
|--------|------|-------------|
| GET | `/api/reproducciones` | Lista todos los recursos |
| GET | `/api/reproducciones/{id}` | Obtiene un recurso por id |
| POST | `/api/reproducciones` | Crea un recurso |
| PUT | `/api/reproducciones/{id}` | Actualiza un recurso |
| DELETE | `/api/reproducciones/{id}` | Elimina un recurso |

## DocumentaciÃ³n del proyecto
La documentaciÃ³n completa estÃ¡ en la carpeta [`docs/`](docs/):
- [`docs/00_Resumen.md`](docs/00_Resumen.md) â€” propÃ³sito, responsabilidad y tecnologÃ­as
- [`docs/01_Arquitectura.md`](docs/01_Arquitectura.md) â€” componentes, arquitectura y patrones
- [`docs/02_API.md`](docs/02_API.md) â€” contrato REST y ejemplos curl
- [`docs/03_Pruebas.md`](docs/03_Pruebas.md) â€” tests unitarios, cobertura y Cucumber
- [`docs/04_Despliegue.md`](docs/04_Despliegue.md)
- [`docs/05_Justificacion.md`](docs/05_Justificacion.md) â€” justificaciÃ³n del servicio
- [`docs/diagramas/`](docs/diagramas/) â€” C4, secuencia e infraestructura AWS

## CÃ³mo ejecutar localmente
```bash
mvn spring-boot:run
<!-- prueba de comentario loggin added-->

<!-- Configuración de registro de reproducciones agregada -->

```bash
docker compose up --build
# http://localhost:8080
```

## CÃ³mo ejecutar las pruebas

```bash
mvn test      # unit tests + Cucumber
mvn verify    # + verificaciÃ³n de cobertura JaCoCo (100% LINE, falla si baja)
```

<!-- Métricas del servicio integradas -->

<!-- Integración de métricas de uso -->

<!-- Integración de métricas de uso -->

<!-- Integracion de metricas de uso -->
<!-- Configuración de registro de reproducciones agregada -->
