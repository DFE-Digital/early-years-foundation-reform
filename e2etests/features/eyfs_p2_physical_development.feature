Feature: EYFS - Physical Development - Links

  Background:

    Given "EYFS service" user
    When user proceeds to "Physical development" page


  Scenario:  Physical Development page - Links

    Then page has heading "Physical development"
    Then "Left menu pane" item "2" is "Physical development"
    And the following "links" are available:
      | Core strength and co-ordination[3 times] |
      | Gross motor skills[2 times]              |
      | Fine motor skills[2 times]               |


  Scenario:  Physical Development page - Link - Core Strength and Co-ordination

    When clicks on "Core strength and co-ordination"
    Then page has heading "Core strength and co-ordination"


  Scenario:  Physical Development page - Link - Gross Motor Skills

    When clicks on "Gross motor skills"
    Then page has heading "Gross motor skills"


  Scenario:  Physical Development page - Link - Fine Motor Skills

    When clicks on "Fine motor skills"
    Then page has heading "Fine motor skills"
