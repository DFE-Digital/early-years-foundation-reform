Feature: EYFS - CMS - Administrator - E2E

  Background:

    Given "EYFS CMS Administrator" user
    When user proceeds to "Add user" page
    Then page has heading "Add user"


  Scenario:  Add User - Without field values - Error messages

    When user clicks "Save" button
    Then following is "displayed":
      | There is a problem |
    And the following "links" are available:
      | You must provide a valid DfE email address (@education.gov.uk and @digital.education.gov.uk |
      | Password must not be blank                                                                  |
      | Select an editor or administrator role type                                                 |
    When clicks on "Cancel"
    Then page has heading "User administration"


  Scenario:  Add User - Valid values - Cancel

    When user proceeds to "add user details and cancel" via "Add user" page
    Then page has heading "User administration"
    And user is not created


  Scenario:  Add User - Save - Edit - Delete

    When user proceeds to "add user, edit and delete" via "Add user" page
    Then page has heading "User administration"


  Scenario: Add user - Password validation - Password less than minimal length

    When user proceeds to "add user with invalid passwords" via "Add user" page
    When "1" entered in "user-password-field" and "Save" clicked
    Then following is "displayed":
      | There is a problem |
    And the following "links" are available:
      | Password must be a minimum of 8 characters long |
      | Password confirmation does not match password   |


  Scenario: Edit user - Password validation - Password must be different

    When user proceeds to "edit user with invalid passwords" via "Add user" page
    Then following is "displayed":
      | There is a problem |
    And the following "links" are available:
      | Password must be different than the current password |
      | Password confirmation does not match password        |


  Scenario: Add user - Password validation - Password must contain at least 2 uppercase characters

    When user proceeds to "add user with invalid passwords" via "Add user" page
    When "Abba12!?" entered in "user-password-field" and "Save" clicked
    Then following is "displayed":
      | There is a problem |
    And the following "links" are available:
      | Password must contain at least 2 uppercase characters |
      | Password confirmation does not match password         |


  Scenario: Add user - Password validation - Password must contain at least 2 lowercase characters

    When user proceeds to "add user with invalid passwords" via "Add user" page
    When "aBBA12!?" entered in "user-password-field" and "Save" clicked
    Then following is "displayed":
      | There is a problem |
    And the following "links" are available:
      | Password must contain at least 2 lowercase characters |
      | Password confirmation does not match password         |


  Scenario: Add user - Password validation - Password must contain at least 2 digits

    When user proceeds to "add user with invalid passwords" via "Add user" page
    When "AbBa1*!?" entered in "user-password-field" and "Save" clicked
    Then following is "displayed":
      | There is a problem |
    And the following "links" are available:
      | Password must contain at least 2 digits       |
      | Password confirmation does not match password |


  Scenario: Add user - Password validation - Password must contain at least 2 special characters or non-alphanumeric characters

    When user proceeds to "add user with invalid passwords" via "Add user" page
    When "AbBa12!0" entered in "user-password-field" and "Save" clicked
    Then following is "displayed":
      | There is a problem |
    And the following "links" are available:
      | Password must contain at least 2 special characters or non-alphanumeric characters |
      | Password confirmation does not match password                                      |
