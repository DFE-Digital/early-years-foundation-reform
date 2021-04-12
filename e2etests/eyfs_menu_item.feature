# Acceptance Test 28.01.21 (HFEYP-51)

Feature: EYFS - Menu Item - Links

  Background:

    Given "PVI Practitioner" user
    When user proceeds to "Help for early years providers and professionals" page
    When "Menu" is "expanded"


  Scenario:  Menu Item - Expand and Collapse - Links

    Then the following "menu links" are available:
      | Communication and language                  |
      | Physical development                        |
      | Personal, social, and emotional development |
      | Literacy                                    |
      | Mathematics                                 |
      | Understanding the world                     |
      | Expressive arts and design                  |
    When "Menu" is "collapsed"
    Then the following "menu links" are no longer available:
      | Communication and language                  |
      | Physical development                        |
      | Personal, social, and emotional development |
      | Literacy                                    |
      | Mathematics                                 |
      | Understanding the world                     |
      | Expressive arts and design                  |


  Scenario:  Menu Item - Communication and Language - Expand and Collapse

    And "Menu item Communication and language" is "expanded"
    Then the following "menu links" are available:
      | Conversations |
      | Reading       |
      | Role-play     |
    When "Menu item Communication and language" is "collapsed"
    Then the following "menu links" are no longer available:
      | Conversations |
      | Reading       |
      | Role-play     |


  Scenario:  Menu Item - Physical development - Expand and Collapse

    And "Menu item Physical development" is "expanded"
    Then the following "menu links" are available:
      | Core strength and co-ordination |
      | Gross motor skills              |
      | Fine motor skills               |
    When "Menu item Physical development" is "collapsed"
    Then the following "menu links" are no longer available:
      | Core strength and co-ordination |
      | Gross motor skills              |
      | Fine motor skills               |


  Scenario:  Menu Item - Personal, social and emotional development - Expand and Collapse

    And "Menu item Personal, social and emotional development" is "expanded"
    Then the following "menu links" are available:
      | Managing emotions  |
      | Personal needs     |
      | Resolving conflict |
    When "Menu item Personal, social and emotional development" is "collapsed"
    Then the following "menu links" are no longer available:
      | Managing emotions  |
      | Personal needs     |
      | Resolving conflict |


  Scenario:  Menu Item - Literacy - Expand and Collapse

    And "Menu item Literacy" is "expanded"
    Then the following "menu links" are available:
      | Comprehension |
      | Word reading  |
      | Writing       |
    When "Menu item Literacy" is "collapsed"
    Then the following "menu links" are no longer available:
      | Comprehension |
      | Word reading  |
      | Writing       |


  Scenario:  Menu Item - Mathematics - Expand and Collapse

    And "Menu item Mathematics" is "expanded"
    Then the following "menu links" are available:
      | Counting          |
      | Number patterns   |
      | Spatial reasoning |
    When "Menu item Mathematics" is "collapsed"
    Then the following "menu links" are no longer available:
      | Counting          |
      | Number patterns   |
      | Spatial reasoning |


  Scenario:  Menu Item - Understanding the World - Expand and Collapse

    And "Menu item Understanding the world" is "expanded"
    Then the following "menu links" are available:
      | Personal experiences |
      | Diverse world        |
      | Widening vocabulary  |
    When "Menu item Understanding the world" is "collapsed"
    Then the following "menu links" are no longer available:
      | Personal experiences |
      | Diverse world        |
      | Widening vocabulary  |


  Scenario:  Menu Item - Expressive arts and design - Expand and Collapse

    And "Menu item Expressive arts and design" is "expanded"
    Then the following "menu links" are available:
      | Imagination and creativity |
      | Self-expression            |
      | Communicating through arts |
    When "Menu item Understanding the world" is "collapsed"
    Then the following "menu links" are no longer available:
      | Imagination and creativity |
      | Self-expression            |
      | Communicating through arts |
