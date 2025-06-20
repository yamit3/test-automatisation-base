@CTP-HU-000 @chapter_evaluation
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

  @id:1 @get_one @201
  Scenario: T-API-HU-0000-get-all get-all - karate
    When method GET
    Then status 200
    And print response[0]
#
#  @id:2 @get_one @400
#  Scenario Outline: T-API-HU-001-CA01-Hero successfully created 200 - karate
#    * def jsonData = read('classpath:data/create/create-duplicate.json')
#    And request jsonData
#    When method POST
#    Then status <resultStatus>