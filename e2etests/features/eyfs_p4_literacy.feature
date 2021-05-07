Feature: EYFS - Literacy - Links

  Background:

    Given the site is visited
    When user proceeds to "Literacy" page


  Scenario:  Literacy page - Links

    Then page has heading "Literacy"
    Then "Left menu pane" item "4" is "Literacy"
    And the following "links" are available:
      | Comprehension[3 times] |
      | Pre-reading[2 times]   |
      | Pre-writing[2 times]   |


  Scenario:  Literacy page - Link - Comprehension

    When clicks on "Comprehension"
    Then page has heading "Comprehension"


  Scenario:  Literacy page - Link - Pre-reading (Word reading)

    When clicks on "Pre-reading"
    Then page has heading "Pre-reading"


  Scenario:  Literacy page - Link - Pre-writing (Writing)

    When clicks on "Pre-writing"
    Then page has heading "Pre-writing"
