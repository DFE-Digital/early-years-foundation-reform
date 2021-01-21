# Example

Feature: EYFS breadcrumb trail


  Scenario:  Click end of breadcrumb trail

    Given "PVI" user is on page "[insert page name]"
    And the bread crumb trail is "[a>b>c>d]"
    When user clicks end bread crumb
    Then user remains on page and bread crumb does not change


  Scenario:  Click start of breadcrumb trail

    Given "PVI" user is on page "[insert page name]"
    And the bread crumb trail is "[a>b>c>d]"
    When user clicks start of bread crumb
    # Or
    When user clicks bread crumb "a"
    Then user is on page "[insert page name]"
    # Or
    Then user is on page "[insert page name]" with breadcrumb "a"


  Scenario:  Click breadcrumb [c]

    Given "PVI" user is on page "[insert page name]"
    And the bread crumb trail is "[a>b>c>d]"
    When user clicks bread crumb "c"
    Then user is on page "[insert page name]" with breadcrumb "a>b>c"
