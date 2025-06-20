@CTP-HU-002 @chapter_evaluation
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

  @id:1 @list_successful @200
  Scenario: T-API-HU-002-CA01-Hero successfully created 200 - karate
    When method GET
    Then status 200
    And match response[0] != null
