Feature: EYFS - Help for early years providers - Footer

  Background:

    Given "EYFS Service" user
    When user proceeds to "Help for early years providers" page


  Scenario:  Help for early years providers - Footer - Open Government Licence - Text

    Then following is "displayed":
      | All content is available under the |
      | except where otherwise stated      |


  Scenario:  Help for early years providers - Footer - Open Government Licence - Link

    When clicks on "Open Government Licence v3.0"
    Then page has "h3" heading "Using Information under this licence"


  Scenario:  Help for early years providers - Footer - Cookie Policy - Link

    When clicks on "Cookies"
    Then page has heading "Cookies"


  Scenario:  Help for early years providers - Footer - Accessibility Statement - Link

    When clicks on "Accessibility"
    Then page has heading "Accessibility statement for the Help for early years providers service"


  Scenario:  Help for early years providers - Footer - Disclaimer - Link

    When clicks on "Disclaimer"
    Then page has heading "Disclaimer"


  Scenario:  Help for early years providers - Footer - Contact us - Link

    When clicks on "Contact us"
    Then page has heading "Contact us"


  Scenario:  Help for early years providers - Footer - Crown Copyright - Link

    When clicks on "© Crown copyright"
    Then page has heading "Crown copyright"
