Feature: Get top rated movies

    Scenario Outline: Get top rated movies using valid access token and valid page number
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And user wants movies data from "page" number "<page>"
        When user submits the request "/movie/top_rated" to get top rated movies
        Then you should receive a "200" status code
        And "page" number "<page>" should be there in response body
        Examples:
            | page |
            |1 |
            |10 |

    Scenario Outline: Get top rated movies using valid access token and out of range page number
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And user wants movies data from "page" number "<page>"
        When user submits the request "/movie/top_rated" to get top rated movies
        Then you should receive a "422" status code
        Examples:
            | page |
            |0 |
            |1000 |

    Scenario Outline: Get top rated movies using invalid access token
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d5656"
        And user wants movies data from "page" number "<page>"
        When user submits the request "/movie/top_rated" to get top rated movies
        Then you should receive a "401" status code
        Examples:
            | page |
            |5 |


    Scenario Outline: Get top rated movies using valid access token and invalid page number
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And user wants movies data from "page" number "<page>"
        When user submits the request "/movie/top_rated" to get top rated movies
        Then you should receive a "400" status code
        Examples:
            | page |
            |300test1 |