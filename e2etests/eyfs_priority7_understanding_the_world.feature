# Example

Feature: EYFS - Understanding the World - Content

  Background:

    Given "EYFS" user
    When user proceeds to "Understanding the world" page


  Scenario:  Understanding the World page - Content

    Then following is displayed:
      | Some Text |
    And the following "links" are available:
      | Link 1 |
      | Link 2 |


  Scenario:  Understanding the World - Sub-Category '?' content

    And proceeds to "[Sub-category name]"
    #When "[Sub-category name / Section name]" is expanded
    Then following is displayed:
        " Some Text "
    And the following "links" are available:
      | Link 3 |
      | Link 4 |