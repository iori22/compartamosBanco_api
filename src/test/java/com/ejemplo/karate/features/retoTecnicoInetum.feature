Feature: Como un administrador del sistema,
Quiero poder gestionar los usuarios a través de la API,
Para administrar la base de datos de usuarios.

  Background:
    * configure ssl = true
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    Given url baseUrl
    #Given url 'https://serverest.dev'
    # Cargar el archivo JSON desde tu estructura de carpetas
    * def responseData = read('classpath:schemas/usuario-schema.json')

  @Listar
  Scenario: Validar el endPoint de: GET /usuarios - Listar usuarios
    Given path 'usuarios'
    When method get
    Then status 200
    And assert responseTime < 3000

    # Validar estructura general
    And match response.quantidade == '#number'
    And match response.usuarios == '#array'
    And match response.quantidade == response.usuarios.length


  @Crear
  Scenario Outline: Validar el endPoint de: POST /usuarios - Registrar usuario - <descripcion>
    * def crearBody =
      """
      {
        "nome": "<nombre>",
        "email": "<email>",
        "password": "<password>",
        "administrador": "<administrador>"
      }
      """

    Given path 'usuarios'
    And request crearBody
    When method post

    # Esto imprime el JSON completo en el log
    * print 'RESPUESTA RECIBIDA:', response

    Then status <codeStatus>
    And assert responseTime < 3000

    * def respuestaEsperada = responseData[<index>]
    And match response == respuestaEsperada


    Examples:
      | descripcion           | nombre    | email               | password  | administrador | codeStatus | index |
      | Happy-Path            | Anthony05 | Anthony27@qa.com.br | Anthony04 | true          | 201        | 0     |
      | Usuario ya registrado | Anthony02 | fulano@qa.com.br    | Anthony02 | true          | 400        | 1     |
      | Correo invalido       | Anthony03 | correo-invalido     | Anthony03 | true          | 400        | 2     |



  @Buscar
  Scenario Outline: Validar el endPoint de: GET /usuarios - Buscar usuarios - <descripcion>
    Given path 'usuarios',"<usuario>"
    When method get
    Then status <codeStatus>
    And assert responseTime < 3000
    * def respuestaEsperada = responseData[<index>]
    And match response == respuestaEsperada

    Examples:
      | descripcion           | usuario          | codeStatus | index |
      | Happy-Path            | 0uxuPY0cbmQhpEz1 | 200        | 3     |
      | Usuario No encontrado | 0uxuPY0cbmQhpE11 | 400        | 4     |



  @delete
  Scenario Outline: Validar el endPoint de: DELETE /usuarios - Eliminar usuarios - <descripcion>
    Given path 'usuarios',"<usuario>"
    When method delete
    Then status <codeStatus>
    And assert responseTime < 3000
    * def respuestaEsperada = responseData[<index>]
    And match response == respuestaEsperada

    Examples:
      | descripcion           | usuario          | codeStatus | index |
      | Happy-Path            | cUvRDyfREOlEyROo | 200        | 5     |
      | Usuario No encontrado | WdrrsICMXItXsxU9 | 400        | 6     |