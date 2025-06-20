@CTP-HU-000 @utils
Feature: HU-001 crear un superhéroe
  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * path 'jycalder', 'api', 'characters'
    * def generarHeaders =
      """
      function() {
        return {
          "Content-Type": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @get_all @201
  Scenario: T-API-HU-0000-get-all get-all - karate
    When method GET
    Then status 200
    And print response

  @id:2 @delete_all @201
  Scenario: T-API-HU-0000-delete-all delete-all - karate
    * def resp = call read('util.feature@get_all')
    * def heroes = resp.response
  # Loop through each hero and delete it
    * if (heroes && heroes.length > 0){ for (i = 0; i < heroes.length; i++) karate.call('@delete_one', { id: heroes[i].id }) }

  @id:3 @delete_one
  Scenario: Delete hero by ID
    * path id
    * method DELETE
    * status 204 or status 404