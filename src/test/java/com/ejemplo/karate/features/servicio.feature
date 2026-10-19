Feature: Prueba básica de API


/*
Ejecuta los tests con Maven:
mvn clean test

Genera el reporte Allure:
mvn allure:report

Para abrirlo en el navegador:
mvn allure:serve


  Background:
    * configure ssl = true
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    Given url 'https://reqres.in'
    * header x-api-key = 'reqres-free-v1'

  Scenario: Consulta API – Get User (CompartamosBanco)
    Given path 'api', 'users', 2
    When method get
    Then status 200
    * def nombre = response.data.first_name
    * def apellido = response.data.last_name
    * def nombreCompleto = nombre + ' ' + apellido
    And match nombreCompleto == 'Janet Weaver'

  Scenario: LOGIN EXITOSO - POST
    * def crearBody =
  """
    {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
    }
  """
    Given path 'api', 'login'
    And request crearBody
    When method post
    Then status 200
    And match response.token != null

  @COD_XRAY-012
  Scenario: LOGIN ERROR - POST
    * def crearBody =
  """
    {
    "email": "peter@klaven"
    }
  """
    Given path 'api', 'login'

    And request crearBody
    When method post
    Then status 400
    And match response.error == 'Missing password'



  @COD_XRAY-013
  Scenario: Registrar usuario - POST
    * def crearBody =
  """
  {
    "name": "morpheus",
    "job": "leader"
  }
  """
    Given path 'api', 'users'

    And request crearBody
    When method post
    Then status 201
    And match response.id != null
    And match response.createdAt != null


  @COD_XRAY-014
  Scenario: Actualizar usuario - PUT
    * def crearBody =
  """
{
    "name": "morpheus",
    "job": "zion resident"
}
  """
    Given path 'api', 'users' , 2

    And request crearBody
    When method put
    Then status 200
    And match response.updatedAt != null