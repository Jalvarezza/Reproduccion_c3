# Reproduccion de un Microservicio de riesgo reproduccion

Microservicio correspondiente al **caso 03 - StreamVerse**, Plataforma de streaming desarrollada para la **Evaluación Parcial N°1** de Ingeniería DevOps.

El servicio administra la información y la lógica asociada al dominio de **Reproducción**, aplicando principios de arquitectura de microservicios, integración continua, control de versiones y automatización de pruebas.

| Categoría | Tecnologías |
|-----------|-------------|
| Stack | Spring Boot 3.3 · Java 21 · Maven · Spring Data JPA · H2 · springdoc-openapi |
| Calidad | JaCoCo cobertura LINE 100% · Cucumber (BDD) alineado a endpoints REST |
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
<!-- prueba de comentario loggin added-->

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


---

# Evaluación Parcial N°2 — Pipeline CI/CD

## 1. Integración continua con GitHub Actions

El pipeline se encuentra configurado en `.github/workflows/ci.yml`.

Se ejecuta automáticamente cuando se realiza un push a `develop` o `main`, y cuando se crea o actualiza un Pull Request hacia estas ramas.

### Etapas del pipeline

1. **Preparación:** descarga el código y configura Java 21 con Maven.
2. **Pruebas:** ejecuta las pruebas automatizadas y verifica la cobertura con JaCoCo.
3. **Análisis de calidad:** ejecuta SonarQube Cloud y comprueba el Quality Gate.
4. **Construcción Docker:** construye una imagen identificada con el SHA del commit.
5. **Despliegue simulado:** levanta el microservicio mediante Docker Compose.
6. **Verificación:** comprueba que el contenedor alcance un estado saludable.

### Diagrama del pipeline CI/CD

```mermaid
flowchart TD
    A["Push o Pull Request"] --> B["GitHub Actions"]
    B --> C["Configurar Java 21 y Maven"]
    C --> D["Pruebas JUnit y cobertura JaCoCo"]
    D --> E{"¿Pruebas y cobertura aprobadas?"}
    E -->|No| F["Pipeline detenido"]
    E -->|Sí| G["Análisis SonarQube Cloud"]
    G --> H{"¿Quality Gate aprobado?"}
    H -->|No| F
    H -->|Sí| I["Construir imagen Docker con SHA"]
    I --> J["Desplegar con Docker Compose"]
    J --> K{"¿Healthcheck saludable?"}
    K -->|No| F
    K -->|Sí| L["Pipeline completado"]
```

---

## 2. Contenedores Docker

El proyecto utiliza un `Dockerfile` multi-stage, que separa la compilación y la ejecución del microservicio.

- **Primera etapa:** utiliza Maven y Java 21 para compilar la aplicación.
- **Segunda etapa:** utiliza una imagen Java 21 JRE basada en Alpine para ejecutar el archivo JAR.
- **Seguridad:** ejecuta la aplicación con un usuario sin privilegios (`appuser`).
- **Puerto:** expone el puerto 8080.

La imagen se construye automáticamente desde GitHub Actions, utilizando el SHA del commit para identificar la versión generada.

---

## 3. Pruebas automatizadas

El microservicio utiliza pruebas automatizadas con JUnit y Maven.

El pipeline ejecuta el siguiente comando:

```bash
mvn -B clean verify
```

Este comando permite ejecutar las pruebas, generar el reporte de JaCoCo y verificar la cobertura mínima configurada.

### Resultados verificados

- 20 pruebas ejecutadas correctamente.
- Cobertura de líneas del 100 % en las clases incluidas en la verificación de JaCoCo.
- Reporte de cobertura disponible en `target/site/jacoco/jacoco.xml`.

Si una prueba falla o no se cumple la cobertura mínima, el pipeline se detiene y no continúa con las siguientes etapas.

---

## 4. Seguridad y calidad del código

### SonarQube Cloud

Se integró SonarQube Cloud al pipeline para analizar el código y verificar el cumplimiento del Quality Gate.

La integración utiliza:

- El secreto `SONAR_TOKEN` configurado en GitHub.
- El análisis mediante Maven.
- El reporte de cobertura generado por JaCoCo.
- La opción `-Dsonar.qualitygate.wait=true`.

Esta última configuración permite que GitHub Actions espere el resultado del Quality Gate.

Si el análisis falla o el Quality Gate no se aprueba, el pipeline se detiene antes de construir y desplegar la imagen Docker.

En la ejecución verificada se obtuvo el resultado:

`QUALITY GATE STATUS: PASSED`

### Dependabot

Se configuró `.github/dependabot.yml` para revisar semanalmente las actualizaciones de dependencias.

La configuración incluye:

- **Maven:** revisión de dependencias del proyecto.
- **GitHub Actions:** revisión de versiones de las acciones utilizadas en el pipeline.

Ambas revisiones están programadas con frecuencia semanal (`weekly`).

### Política de bloqueo

El pipeline impide continuar con la construcción y el despliegue cuando:

- Fallan las pruebas automatizadas.
- No se cumple la cobertura mínima configurada.
- Falla el análisis de SonarQube o su Quality Gate.

---

## 5. Despliegue automatizado y trazabilidad

El despliegue se ejecuta automáticamente después de superar las verificaciones de pruebas y calidad.

### Construcción de la imagen

GitHub Actions construye una imagen Docker utilizando el SHA del commit:

```bash
docker build -t duoc/caso03-reproduccion:${GITHUB_SHA} .
```

Esto permite relacionar la imagen construida con una versión específica del código.

### Despliegue simulado

La imagen construida recibe también la etiqueta utilizada por Docker Compose:

```bash
docker tag duoc/caso03-reproduccion:${GITHUB_SHA} duoc/caso03-reproduccion:1.0.0
```

Posteriormente, se ejecuta:

```bash
docker compose up -d --no-build
```

El parámetro `--no-build` permite utilizar la imagen ya construida, evitando generar otra durante el despliegue.

### Verificación del despliegue

El pipeline revisa el estado del contenedor mediante su healthcheck.

Si el servicio alcanza el estado `healthy`, la verificación se completa correctamente.

Si el servicio presenta errores o no alcanza el estado saludable dentro del tiempo establecido, el pipeline falla.

### Trazabilidad

Los cambios y resultados pueden consultarse mediante:

- Historial de commits y Pull Requests.
- Ejecuciones de GitHub Actions.
- Resultados de las pruebas y análisis de calidad.
- Identificación de la imagen Docker mediante el SHA del commit.
- Registros del despliegue simulado.

**Importante:** el despliegue se realiza en el entorno temporal de GitHub Actions y no corresponde a un despliegue permanente en producción.

---

## 6. Orquestación con Docker Compose

Se utiliza `docker-compose.yml` para configurar y ejecutar el microservicio en un contenedor.

La configuración incorpora:

- Exposición del puerto 8080.
- Límites y reservas de recursos.
- Política de reinicio `unless-stopped`.
- Healthcheck para verificar el estado de la aplicación.
- Ejecución del servicio mediante una imagen Docker.

### Recursos configurados

| Recurso | Reserva | Límite |
|---------|---------|--------|
| CPU | 0.25 | 0.75 |
| Memoria | 256 MB | 512 MB |

### Healthcheck

El servicio utiliza una comprobación de salud con los siguientes parámetros:

- Intervalo: 30 segundos.
- Tiempo máximo de respuesta: 5 segundos.
- Reintentos: 3.
- Período inicial de espera: 40 segundos.

La configuración permite comprobar el funcionamiento del microservicio durante el despliegue simulado.

Actualmente se utiliza una instancia del contenedor, con límites de recursos definidos.

---

## 7. Verificación del pipeline

Durante las pruebas de integración se verificó:

- Ejecución correcta de las pruebas automatizadas.
- Generación y validación de cobertura JaCoCo.
- Análisis de SonarQube Cloud aprobado.
- Construcción de la imagen Docker.
- Despliegue simulado con Docker Compose.
- Verificación satisfactoria del healthcheck.
- Ejecución completa de GitHub Actions con resultado exitoso.

Las evidencias de ejecución se encuentran en la pestaña **Actions** del repositorio.

---

## 8. Declaración de uso de IA

Durante esta evaluación utilizamos ChatGPT como apoyo para aclarar dudas, comprender algunos conceptos, revisar configuraciones y mejorar la documentación. También nos ayudó a proponer soluciones técnicas, que posteriormente revisamos y verificamos en el proyecto, además de permitirnos profundizar nuestro aprendizaje a través de la interacción.

---

## 9. Reflexiones individuales - PAMELA ALBANESE - 06/11/2026

Sigo manteniendo mi postura de la evaluación anterior, pero esta vez agregaría que me parece impresionante darme cuenta de cómo acciones que pueden parecer tan pequeñas son capaces de prevenir grandes problemas que podrían presentarse en un entorno de producción.

También destaco el trabajo en equipo y la coordinación que logramos mantener durante esta evaluación, considerando que ambos tenemos responsabilidades y situaciones personales fuera del ámbito académico que debemos compatibilizar con nuestros estudios.

## 10. Reflexión - Jorge Alvarez - 06/11/2026

Enfrentar la entrega del microservicio `reproduccion-svc` me permitió consolidar el paso de la teoría a la práctica en un entorno DevOps real. El principal valor no estuvo solo en el código Java 21, sino en asegurar la infraestructura, la calidad y la automatización del despliegue.

Resolver los conflictos de integración en GitFlow como el ajuste de codificación UTF-8 y la limpieza del `pom.xml` al fusionar `feature/docker-setup` con `develop` reafirmamos la importancia del control de versiones. Además, la creación del `Dockerfile` multietapa con usuario no-root (`appuser`) y la orquestación en `docker-compose.yml` me permitieron aplicar estándares profesionales de contenerización y seguridad.
