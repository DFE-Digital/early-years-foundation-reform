Feature: EYFS - Literacy - Links

  Background:

    Given "EYFS service" user
    When user proceeds to "Literacy" page


  Scenario:  Literacy page - Links

    Then page has heading "Literacy"
    Then "Left menu pane" item "4" is "Literacy"
    And the following "links" are available:
      | Reading comprehension[3 times] |
      | Exploring words[2 times]       |
      | Writing[2 times]               |


  Scenario:  Literacy page - Link - Reading comprehension

    When clicks on "Reading comprehension"
    Then page has heading "Reading comprehension"


  Scenario:  Literacy page - Link - Exploring words

    When clicks on "Exploring words"
    Then page has heading "Exploring words"


  Scenario:  Literacy page - Link - Writing (Writing)

    When clicks on "Writing"
    Then page has heading "Writing"
