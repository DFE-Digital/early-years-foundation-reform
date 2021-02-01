#  Based upon DfE Signin to Supply-Teachers
#  Single sign-in page to use TBC
#  Tests to confirm access and authorisation for 'Content Editor' users

Feature: EYFS Signin Forgotten Password Page


  Background:
    Given user is on "Department for Education Sign-in" page


  Scenario:  Signin Page - Links - Link - Forgotten Password

    When user clicks "Forgotten your password?"
    Then the "Forgotten your password?" page is displayed
    And user is able to enter email and request password reset
