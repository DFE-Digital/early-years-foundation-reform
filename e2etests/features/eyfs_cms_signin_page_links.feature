##  Based upon DfE Signin to Supply-Teachers
##  Single sign-in page to use TBC
#
#Feature: EYFS Signin Page Links
#
#
#  Background:
#    Given user is on "Department for Education Sign-in" page
#
#
#  Scenario:  Signin Page - Links - Header link - Feedback
#
#    When user clicks "feedback"
#    Then the following is "displayed":
#    # new tab
#      | The survey will help us to understand your needs better and allow us to continually improve DfE Sign-in. |
#      | Where in the United Kingdom are you based?                                                               |
#
#
#  Scenario:  Signin Page - Links - Footer link - Cookies
#
#    When user clicks "Cookies"
#    Then the "Cookies on Department for Education" page is displayed
#
#
#  Scenario:  Signin Page - Links - Footer link - Terms and Conditions
#
#    When user clicks "Terms and conditions"
#    Then the "Terms and conditions" page is displayed
#    And the following is "displayed":
#  "Welcome to DfE Sign-in, the Department for Education's secure single sign-in system for access to DfE online services."
#
#
#  Scenario:  Signin Page - Links - Footer link - Need help using this service
#
#    When user clicks "Need help using this service?"
#    Then the "DfE Sign-in help" page is displayed
#
#
#  Scenario:  Signin Page - Links - Footer link - Privacy Notice
#
#    When user clicks "Privacy Notice"
#    Then the "Privacy Notice for DfE Sign-in v0.1" page is displayed
#    # "Need to question v0.1 being part of a page title"
#
#
#  Scenario:  Signin Page - Links - Footer link - Open Government Licence v3.0
#
#    When user clicks "Open Government Licence v3.0"
#    Then the "Open Government Licence" is displayed
