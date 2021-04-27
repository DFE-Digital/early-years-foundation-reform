Feature: EYFS - Expressive Arts and Design - Links

  Background:

    Given "EYFS service" user
    When user proceeds to "Expressive arts and design" page


  Scenario:  Expressive Arts and Design page - Links

    Then page has heading "Expressive arts and design"
    Then "Left menu pane" item "7" is "Expressive arts and design"
    And the following "links" are available:
      | Imagination and creativity[3 times] |
      | Self-expression[2 times]            |
      | Communicating through arts[2 times] |


  Scenario:  Expressive Arts and Design page - Link - Imagination and Creativity

    When clicks on "Imagination and creativity"
    Then page has heading "Imagination and creativity"


  Scenario:  Expressive Arts and Design page - Link - Self Expression

    When clicks on "Self-expression"
    Then page has heading "Self-expression"


  Scenario:  Expressive Arts and Design page - Link - Communicating Through Arts

    When clicks on "Communicating through arts"
    Then page has heading "Communicating through arts"
