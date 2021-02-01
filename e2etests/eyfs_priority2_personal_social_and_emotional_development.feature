# Example

Feature: EYFS - Personal, Social and Emotional Development - Content

  Background:

    Given "EYFS" user
    When user proceeds to "Personal, social and emotional development" page


  Scenario:  Personal, Social and Emotional Development page - Content

    Then following is displayed:
      | Some Text |
    And the following "links" are available:
      | Link 1 |
      | Link 2 |


  Scenario:  Personal, Social and Emotional Development - Sub-Category '?' content

    And proceeds to "[Sub-category name]"
    #When "[Sub-category name / Section name]" is expanded
    Then following is displayed:
        " Some Text "
    And the following "links" are available:
      | Link 3 |
      | Link 4 |