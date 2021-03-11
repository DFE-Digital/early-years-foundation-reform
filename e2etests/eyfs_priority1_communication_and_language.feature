# Example

Feature: EYFS - Communication and Language - Content

  Background:

    Given "EYFS" user
    When user proceeds to "Communication and language" page


  Scenario:  Communication and Language page - Content

    Then following is displayed:
      | Some Text |
    And the following "links" are available:
      | Link 1 |
      | Link 2 |


  Scenario:  Communication and Language - Sub-Category '?' content

    And proceeds to "[Sub-category name]"
    #When "[Sub-category name / Section name]" is expanded
    Then following is displayed:
        " Some Text "
    And the following "links" are available:
      | Link 3 |
      | Link 4 |