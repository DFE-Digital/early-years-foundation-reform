# Example

Feature: EYFS - Improving Practice - Content

  Background:

    Given "EYFS" user
    When user proceeds to "Improving practice" page


  Scenario:  Improving Practice page - Content

    Then following is displayed:
      | Some Text |
    And the following "links" are available:
      | Link 1 |
      | Link 2 |


  Scenario:  Improving Practice - Sub-Category '?' content

    And proceeds to "[Sub-category name]"
    #When "[Sub-category name / Section name]" is expanded
    Then following is displayed:
        " Some Text "
    And the following "links" are available:
      | Link 3 |
      | Link 4 |