# Example

Feature: EYFS - Literacy - Content

  Background:

    Given "EYFS" user
    When user proceeds to "Literacy" page


  Scenario:  Literacy page - Content

    Then following is displayed:
      | Some Text |
    And the following "links" are available:
      | Link 1 |
      | Link 2 |


  Scenario:  Literacy - Sub-Category '?' content

    And proceeds to "[Sub-category name]"
    #When "[Sub-category name / Section name]" is expanded
    Then following is displayed:
        " Some Text "
    And the following "links" are available:
      | Link 3 |
      | Link 4 |