@CTP-HU-004 @chapter_evaluation
Feature: HU-004 delete super hero
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

  @id:1 @delete_not_found @400
  Scenario: T-API-HU-004-CA01-Hero not foud updated 200 - karate
    And path '-23'
    When method DELETE
    Then status 404

  @id:2 @delete_hero @404
  Scenario: T-API-HU-004-CA02-Hero deleted 204 - karate
    * def resp = call read('util.feature@get_all')
    * def hero = resp.response[0]
    And path hero.id
    When method DELETE
    Then status 204

