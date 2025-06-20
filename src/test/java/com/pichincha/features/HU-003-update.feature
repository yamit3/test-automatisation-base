@CTP-HU-003 @chapter_evaluation
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

  @id:1 @update_successful @200
  Scenario: T-API-HU-003-CA01-Hero successfully updated 200 - karate
    * def jsonData = read('classpath:data/create/create.json')
    * def resp = call read('util.feature@get_one')
    * def hero = resp.response[0]
    * print 'heros', hero
    And path hero.id
    And request jsonData
    When method PUT
    Then status 200

  @id:2 @update_not_found @404
  Scenario: T-API-HU-003-CA02-Hero not found found 404 - karate
    * def jsonData = read('classpath:data/create/create.json')
    And request jsonData
    And path '-123'
    When method PUT
    Then status 404

