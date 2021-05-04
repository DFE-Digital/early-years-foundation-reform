Feature: EYFS - Mathematics - Links

  Background:

    Given the site is visited
    When user proceeds to "Mathematics" page


  Scenario:  Mathematics page - Links

    Then page has heading "Mathematics"
    Then "Left menu pane" item "5" is "Mathematics"
    And the following "links" are available:
      | Numbers[3 times]                  |
      | Patterns and connections[2 times] |
      | Spatial reasoning[2 times]        |


  Scenario:  Mathematics page - Link - Numbers

    When clicks on "Numbers"
    Then page has heading "Numbers"


  Scenario:  Mathematics page - Link - Patterns and Connections

    When clicks on "Patterns and connections"
    Then page has heading "Patterns and connections"


  Scenario:  Mathematics page - Link - Spatial Reasoning

    When clicks on "Spatial reasoning"
    Then page has heading "Spatial reasoning"
