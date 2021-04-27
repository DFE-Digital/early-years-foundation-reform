Feature: EYFS - Understanding the World - Links

  Background:

    Given "EYFS service" user
    When user proceeds to "Understanding the world" page


  Scenario:  Understanding the World page - Links

    Then page has heading "Understanding the world"
    Then "Left menu pane" item "6" is "Understanding the world"
    And the following "links" are available:
      | Personal experiences[3 times] |
      | Diverse world[2 times]        |
      | Widening vocabulary[2 times]  |


  Scenario:  Understanding the World page - Link - Personal Experiences

    When clicks on "Personal experiences"
    Then page has heading "Personal experiences"


  Scenario:  Understanding the World page - Link - Diverse World

    When clicks on "Diverse world"
    Then page has heading "Diverse world"


  Scenario:  Understanding the World page - Link - Widening Vocabulary

    When clicks on "Widening vocabulary"
    Then page has heading "Widening vocabulary"
