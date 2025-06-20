@CTP-HU-002 @chapter_evaluation
Feature: HU-002 list find super hero(s)
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

  @id:1 @list_successful @200
  Scenario: T-API-HU-002-CA01-Hero successfully listed 200 - karate
    When method GET
    Then status 200
    And match response[0] != null

  @id:2 @find_successful @200
  Scenario: T-API-HU-002-CA02-Hero successfully found 200 - karate
    * def resp = call read('util.feature@get_all')
    * def hero = resp.response[0]
    And path hero.id
    When method GET
    Then status 200
    And match response.id == hero.id

  @id:3 @find_not_found @200
  Scenario: T-API-HU-002-CA03-Hero not found 404 - karate
    And path '-12'
    When method GET
    Then status 404
