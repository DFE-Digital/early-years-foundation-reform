# Example

Feature: EYFS - Mathematics - Content

  Background:

    Given "EYFS" user
    When user proceeds to "Mathematics" page


  Scenario:  Mathematics page - Content

    Then following is displayed:
      | Some Text |
    And the following "links" are available:
      | Link 1 |
      | Link 2 |


  Scenario:  Mathematics - Sub-Category '?' content

    And proceeds to "[Sub-category name]"
    #When "[Sub-category name / Section name]" is expanded
    Then following is displayed:
        " Some Text "
    And the following "links" are available:
      | Link 3 |
      | Link 4 |