@CTP-HU-001 @chapter_evaluation
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

  @id:1 @create_successful @201
  Scenario: T-API-HU-001-CA01-Hero successfully created 200 - karate
    * def jsonData = read('classpath:data/create/create.json')
    And request jsonData
    When method POST
    Then status 201

  @id:2 @create_repeated @400
  Scenario Outline: T-API-HU-004-CA01-Hero duplicated - karate
    * def jsonData = read('classpath:data/create/create-duplicate.json')
    And request jsonData
    When method POST
    Then status <resultStatus>
    Examples:
      | read('classpath:data/create/create-repeated.csv') |

  @id:3 @create_missing_input @400
  Scenario: T-API-HU-001-CA03-missing parameters - karate
    * def jsonData = read('classpath:data/create/create-incomplete.json')
    And request jsonData
    When method POST
    Then status 400
    And match response.alterego == 'Alterego is required'