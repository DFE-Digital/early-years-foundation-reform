## Example
#
#Feature: EYFS Signin Page Validation
#
#  Background:
#    Given user is on "Department for Education Sign-in" page
#
#
#  Scenario:  Signin Page - Validation - Username and Password not entered
#
#    When clicks button "Sign in"
#    Then the following is displayed:
#    #  | Information missing or incorrect |
#      | Please enter your email address  |
#      | Please enter your password       |
#
#
#  Scenario:  Signin Page - Validation - Username not entered
#
#    When "Password" is entered
#    And clicks button "Sign in"
#    Then the following is displayed:
#    #  | Information missing or incorrect |
#      | Please enter your email address  |
#
#
#  Scenario:  Signin Page - Validation - Password not entered
#
#    When "username" is entered
#    And clicks button "Sign in"
#    Then the following is displayed:
#    #  | Information missing or incorrect |
#      | Please enter your password       |
#
#
#  Scenario:  Signin Page - Validation - Username invalid and Password invalid
#
#    When "username" is "invalid" and "password" is "invalid"
#    And clicks button "Sign in"
#    Then the following is displayed:
#    # | Information missing or incorrect                                    |
#      | Sorry, we did not recognise your sign-in details, please try again. |
#
#
#  Scenario:  Signin Page - Validation - Username invalid
#
#    When "username" is "invalid" and "password" is "valid"
#    And clicks button "continue"
#    Then the following is displayed:
#    #  | Information missing or incorrect                                    |
#      | Sorry, we did not recognise your sign-in details, please try again. |
#
#
#  Scenario:  Signin Page - Validation - Password invalid
#
#    When "username" is "valid" and "password" is "invalid"
#    And clicks button "continue"
#    Then the following is displayed:
#    #  | Information missing or incorrect                                    |
#      | Sorry, we did not recognise your sign-in details, please try again. |