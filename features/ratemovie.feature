Feature: Rate movie

    Scenario Outline: Rate movie using valid access token, session id and movie id
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And A user with "session_id" as "172f46d183e551cc00639d928af6585843c9978b"
        And user wants to rate movie which has movie id as <movie_id>
        And user provides rating "value" as "8.0"
        When user submits the request "/movie/movie_id/rating" to provide rating for this movie
        Then you should receive a "201" status code
        And "status_message" should be "Success." in response body
        Examples:
            | movie_id |
            |497 |

    Scenario Outline: Update rating for previously rated movie using valid access token, session id and movie id
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And A user with "session_id" as "172f46d183e551cc00639d928af6585843c9978b"
        And user wants to rate movie which has movie id as <movie_id>
        And user provides rating "value" as "8.0"
        When user submits the request "/movie/movie_id/rating" to provide rating for this movie
        Then you should receive a "201" status code
        And "status_message" should be "record was updated successfully." in response body
        Examples:
            | movie_id |
            |497 |


    Scenario Outline: Rate movie using valid access token, session id and invalid movie id
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And A user with "session_id" as "172f46d183e551cc00639d928af6585843c9978b"
        And user wants to rate movie which has movie id as <movie_id>
        And user provides rating "value" as "8.0"
        When user submits the request "/movie/movie_id/rating" to provide rating for this movie
        Then you should receive a "404" status code
        And "status_message" should be "The resource you requested could not be found" in response body
        Examples:
            | movie_id |
            |999 |

    Scenario Outline: Rate movie using invalid access token, valid session id and movie id
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d4888"
        And A user with "session_id" as "172f46d183e551cc00639d928af6585843c9978b"
        And user wants to rate movie which has movie id as <movie_id>
        And user provides rating "value" as "8.0"
        When user submits the request "/movie/movie_id/rating" to provide rating for this movie
        Then you should receive a "401" status code
        And "status_message" should be "Invalid API key" in response body
        Examples:
            | movie_id |
            |497 |

    Scenario Outline: Rate movie using valid access token, movie id and invalid session id
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And A user with "session_id" as "172f46d183e551cc00639d928af6585843c9978bff"
        And user wants to rate movie which has movie id as <movie_id>
        And user provides rating "value" as "8.0"
        When user submits the request "/movie/movie_id/rating" to provide rating for this movie
        Then you should receive a "401" status code
        And "status_message" should be "Authentication failed" in response body
        Examples:
            | movie_id |
            |497 |

    Scenario Outline: Rate movie using valid access token, movie id, session id and invalid body param
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And A user with "session_id" as "172f46d183e551cc00639d928af6585843c9978b"
        And user wants to rate movie which has movie id as <movie_id>
        And user provides rating "value3" as "8.0"
        When user submits the request "/movie/movie_id/rating" to provide rating for this movie
        Then you should receive a "400" status code
        And "status_message" should be "Invalid parameters" in response body
        Examples:
            | movie_id |
            |497 |

    Scenario Outline: Rate movie using valid access token, movie id, session id and invalid rating value
        Given A user with "api_key" as "cb3ce193137177c9be790a989ef0f51d"
        And A user with "session_id" as "172f46d183e551cc00639d928af6585843c9978b"
        And user wants to rate movie which has movie id as <movie_id>
        And user provides rating "value" as "12.0"
        When user submits the request "/movie/movie_id/rating" to provide rating for this movie
        Then you should receive a "400" status code
        And "status_message" should be "Value too high" in response body
        Examples:
            | movie_id |
            |497 |