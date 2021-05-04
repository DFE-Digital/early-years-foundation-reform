Feature: EYFS - Communication and Language - Links

  Background:

    Given the site is visited
    When user proceeds to "Communication and language" page


  Scenario:  Communication and Language page - Links

    Then page has heading "Communication and language"
    Then "Left menu pane" item "1" is "Communication and language"
    And the following "links" are available:
      | Interactions[3 times]       |
      | Exploring language[2 times] |
      | Listening and understanding[2 times] |


  Scenario:  Communications and Language page - Link - Listening and Understanding

    When clicks on "Listening and understanding"
    Then page has heading "Listening and understanding"


  Scenario:  Communications and Language page - Link - Exploring Language

    When clicks on "Exploring language"
    Then page has heading "Exploring language"


  Scenario:  Communications and Language page - Link - Interactions

    When clicks on "Interactions"
    Then page has heading "Interactions"
