# Reproduccion de un Microservicio de riesgo reproduccion

Microservicio correspondiente al **caso 03 - StreamVerse**, Plataforma de streaming desarrollada para la **Evaluación Parcial N°1** de Ingeniería DevOps.

El servicio administra la información y la lógica asociada al dominio de **Reproducción**, aplicando principios de arquitectura de microservicios, integración continua, control de versiones y automatización de pruebas.

| Categoría | Tecnologías |
|-----------|-------------|
| Stack | Spring Boot 3.3 · Java 21 · Maven · Spring Data JPA · H2 · springdoc-openapi |
| Calidad | JaCoCo cobertura LINE 100% · Cucumber (BDD) alineado a endpoints REST |
| Entrega | Docker / Docker Compose |

## Responsabilidad del microservicio (SRP)

Este microservicio administra exclusivamente los datos y la lógica correspondiente al dominio de Reproducción de StreamVerse, respetando el **Principio de Responsabilidad Única (SRP)**.
Utiliza una base de datos **H2 en memoria** independiente (un solo microservicio por base), manteniendo el aislamiento de los datos del dominio y evitando dependencias directas con bases de datos de otros servicios.

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
Se adoptó el modelo **GitFlow** como estrategia de ramificación para mantener un desarrollo ordenado, trazable y predecible. Esto permite desarrollar nuevas funcionalidades de manera aislada mediante ramas (`feature/`), mantener un entorno de integración continua siempre activo (`develop`), mantener las versiones estables en (`main`) y aplicar correcciones de emergencia (`hotfix/`) sin interferir con el trabajo diario.

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
Como estrategia de trabajo
* No se realizan modificaciones directamente sobre las ramas principales (`main` o `develop`).
* Los cambios se desarrollan en ramas independientes.
* Cada integración debe realizarse mediante un **Pull Request (PR)**
* Los Pull Requests ejecutan automaticamente las varlidaciones configuradas en **GitHub Actions**
* Los cambios se fusionan una vez que las validaciones correspondientes se completan correctamente
Este flujo permite mantener trazabilidad sobre las modificaciones realizadas y detectar problemas antes de incorporar código a las ramas principales.

---

## Documentacion del proyecto

La documentacion completa esta en la carpeta [`docs/`](docs/):

- [`docs/00_Resumen.md`](docs/00_Resumen.md) El proposito, responsabilidad y tecnologias
- [`docs/01_Arquitectura.md`](docs/01_Arquitectura.md) Los componentes, arquitectura y patrones
- [`docs/02_API.md`](docs/02_API.md)  contrato REST y ejemplos curl
- [`docs/03_Pruebas.md`](docs/03_Pruebas.md) Los tests unitarios, cobertura y Cucumber
- [`docs/04_Despliegue.md`](docs/04_Despliegue.md)
- [`docs/05_Justificacion.md`](docs/05_Justificacion.md) La justificacion del servicio: RF/RNF/seguridad cubiertos, stack y por que de cada tecnologia AWS
- [`docs/diagramas/`](docs/diagramas/)  C4 (contexto, contenedores, componentes), secuencia e infraestructura AWS Docker, Docker Compose e integración

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
mvn verify    # + verificación de cobertura JaCoCo (100% LINE, falla si baja)
```

<!-- Historial de integración: Registro de auditoría, trazabilidad de cambios y parches aplicados -->

---

## Declaración de Uso Ético de IA e Integridad Académica

En cumplimiento con los lineamientos de la evaluación, se declara que las herramientas de inteligencia artificial (especificamente Gemini y Chatgpt) fueron empleadas exclusivamente como apoyo técnico para la mejora de redacción en la documentación, formato de archivos Markdown/UTF-8 y consulta de sintaxis de comandos en la terminal. Toda la lógica del pipeline de CI/CD, la resolución de conflictos en GitFlow, la ejecución de comandos y las decisiones técnicas presentadas en este repositorio fueron analizadas, ejecutadas y validadas de forma directa.

---

## Reflexión Personal Jorge Alvarez

Abordar este proyecto de DevOps con un microservicio real significó un cambio de mentalidad importante. Más allá de que el código Java ya viniera estructurado, el verdadero desafío fue en entender que el valor de un software no es solo que funcione en local, sino cómo se integra y despliega de forma segura. Durante el desarrollo, lo que más me marcó fue aplicar GitFlow en la práctica. Enfrentar la resolución manual de conflictos al hacer los merges entre ramas me ayudó a entender por qué existen estas metodologías en la industria y la importancia crítica de la trazabilidad a la hora de agregar nuevas funcionalidades. Ver cómo GitHub Actions automatizaba la compilación en Java 21 y la verificación de JaCoCo al 100% en cada Pull Request me dio una visión clara de lo que es la Integración Continua en un entorno profesional. 
Me quedo con un aprendizaje práctico sólido sobre administración de repositorios, estandarización de commits y automatización, entendiendo que la disciplina en el flujo de trabajo es lo que realmente garantiza la calidad en el desarrollo de software.
Firmado:  
Jorge Alvarez — Estudiante de Ingeniería DevOps  
Fecha: 05-09-2026

## Reflexión Personal Pamela Albanese

Este proyecto me ayudó a entender DevOps de una manera mucho más práctica, ya que varios conceptos que antes conocía principalmente desde la teoría tuvimos que aplicarlos realmente.
Una de las partes que más aprendizaje me dejó fue trabajar con GitFlow. Si bien por complicaciones personales no pude hacer integraciones directamente, pero en el trabajo de equipo, mantuve comunicación constante y fui testigo del proceso, junto a esto y a otros proyectos académicos, que se tuvo que practicar integración, me ha ayudado a entender la importancia de mantener organizados los cambios cuando varias personas trabajan sobre un mismo proyecto.
También me llamó bastante la atención ver GitHub Actions funcionando y cómo procesos como la compilación, las pruebas y la revisión de cobertura con JaCoCo podían ejecutarse automáticamente en cada Pull Request. Esto me permitió entender mucho mejor cómo funciona la Integración Continua en la práctica.
Creo que lo principal que me llevo de este trabajo es entender que desarrollar software no es solamente programar y lograr que funcione, sino también organizar bien el proceso, controlar los cambios y automatizar tareas para evitar errores. Hubo cosas que tuve que ir entendiendo mientras avanzaba, pero justamente eso me ayudó a aterrizar varios conceptos que antes conocía principalmente desde la teoría.
Firmado:  
Pamela Albanese — Estudiante de Ingeniería DevOps  
Fecha: 05-09-2026
