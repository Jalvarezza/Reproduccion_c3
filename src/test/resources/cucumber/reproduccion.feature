# language: es
Característica: Servicio Reproducción (microservicio reproduccion del caso caso03)
  Los escenarios validan el contrato REST del microservicio alineado a sus endpoints.

  Escenario: el listado del recurso responde 200
    Dado el servicio "Reproducción" está disponible
    Cuando consulto el listado de "reproducciones"
    Entonces el listado responde con código 200

  Escenario: ciclo de vida completo del recurso
    Dado un nuevo "reproduccion" con nombre "hola-cucumber"
    Cuando consulto el "reproduccion" recién creado
    Entonces el recurso tiene nombre "hola-cucumber" y código 200
    Cuando actualizo el "reproduccion" con nombre "cucumber-actualizado"
    Entonces el recurso queda con nombre "cucumber-actualizado" y código 200
    Cuando elimino el "reproduccion"
    Entonces la eliminación responde con código 204
    Y al consultar el "reproduccion" eliminado responde 404
