# Example

Feature: EYFS - Physical Development - Content

  Background:

    Given "EYFS" user
    When user proceeds to "Physical development" page


  Scenario:  Physical Development page - Content

    Then following is displayed:
      | Some Text |
    And the following "links" are available:
      | Link 1 |
      | Link 2 |


  Scenario:  Physical Development - Sub-Category '?' content

    And proceeds to "[Sub-category name]"
    #When "[Sub-category name / Section name]" is expanded
    Then following is displayed:
        " Some Text "
    And the following "links" are available:
      | Link 3 |
      | Link 4 |