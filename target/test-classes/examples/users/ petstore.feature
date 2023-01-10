Feature: Pet Store API REST

  Background: Set up url
    Given url 'https://petstore.swagger.io/v2'

  Scenario: Add a new pet
    * def body =
    """
  {
  "id": 0,
  "category": {
  "id": 0,
  "name": "Dogs"
  },
  "name": "Kala",
  "photoUrls": [
  "string"
  ],
  "tags": [
  {
  "id": 0,
  "name": "string"
  }
  ],
  "status": "available"
  }
  """
    Given path 'pet'
    And request body
    And header 'Content-Type' = 'application/json'
    When method POST
    Then status 200
    And match response ==
  """
  {
  "id": #number,
  "category": {
  "id": #number,
  "name": #string
  },
  "name": #string,
  "photoUrls": [
  #string
  ],
  "tags": [
  {
  "id": #number,
  "name": #string
  }
  ],
  "status": #string
  }
  """
    * def id = response.id

  Scenario: Get an pet
    Given path 'pet/9223372036854592255'
    When method GET
    Then status 200
    And match response ==
      """
      {
          "id": 9223372036854592255,
          "category": {
              "id": 0,
              "name": "Dogs"
          },
          "name": #string,
          "photoUrls": [
              "string"
          ],
          "tags": [
              {
                  "id": 0,
                  "name": "string"
              }
          ],
          "status": "available"
      }
      """

    Scenario: Edit a pet
      * def body =
      """
      {
      "id": 9223372036854592255,
      "category": {
        "id": 0,
        "name": "Dogs"
      },
      "name": "Homero",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
      """
      Given path 'pet'
      And request body
      And header 'Content-Type' = 'application/json'
      When method PUT
      Then status 200
      And match response ==
      """
      {
    "id": 9223372036854592255,
    "category": {
        "id": 0,
        "name": "Dogs"
    },
    "name": "Homero",
    "photoUrls": [
        "string"
    ],
    "tags": [
        {
            "id": 0,
            "name": "string"
        }
    ],
    "status": "available"
    }
      """