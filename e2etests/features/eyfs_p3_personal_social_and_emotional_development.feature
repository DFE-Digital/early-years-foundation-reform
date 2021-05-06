Feature: EYFS - Personal, Social and Emotional Development - Links

  Background:

    Given the site is visited
    When user proceeds to "Personal, social and emotional development" page


  Scenario:  Personal, Social and Emotional Development page - Links

    Then page has heading "Personal, social and emotional development"
    Then "Left menu pane" item "3" is "Personal, social and emotional development"
    And the following "links" are available:
      | Emotions[3 times]      |
      | Sense of self[2 times] |
      | Relationships[2 times] |


  Scenario:  Personal, Social and Emotional Development page - Link - Emotions

    When clicks on "Emotions"
    Then page has heading "Emotions"


  Scenario:  Personal, Social and Emotional Development page - Link - Sense of self

    When clicks on "Sense of self"
    Then page has heading "Sense of self"


  Scenario:  Personal, Social and Emotional Development page - Link - Relationships

    When clicks on "Relationships"
    Then page has heading "Relationships"
