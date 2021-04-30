Feature: EYFS - Help for early years providers - Header

  Background:

    Given an ordinary user visits the site
    When user proceeds to "Help for early years providers" page


  Scenario:  Help for early years providers - Header - Govt - Link

    When clicks on "GOV.UK"
    Then page has heading "Welcome to GOV.UK"


  Scenario:  Help for early years providers - Header - Service Name - Link

    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"


  Scenario:  Help for early years providers - Service Name Link - Communication and Language

    When clicks on "Communication and language"
    Then page has heading "Communication and language"
    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"


  Scenario:  Help for early years providers - Service Name Link - Physical Development

    When clicks on "Physical development"
    Then page has heading "Physical development"
    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"


  Scenario:  Help for early years providers - Service Name Link - Personal, Social and Emotional Development

    When clicks on "Personal, social and emotional development"
    Then page has heading "Personal, social and emotional development"
    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"


  Scenario:  Help for early years providers - Service Name Link - Literacy

    When clicks on "Literacy"
    Then page has heading "Literacy"
    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"


  Scenario:  Help for early years providers - Service Name Link - Mathematics

    When clicks on "Mathematics"
    Then page has heading "Mathematics"
    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"


  Scenario:  Help for early years providers - Service Name Link - Understanding the World

    When clicks on "Understanding the world"
    Then page has heading "Understanding the world"
    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"


  Scenario:  Help for early years providers - Service Name Link - Expressive Arts and Design

    When clicks on "Expressive arts and design"
    Then page has heading "Expressive arts and design"
    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"


  Scenario:  Help for early years providers - Service Name Link - Get help to improve your practice

    When clicks on "Communication and language"
    When clicks on "Get help to improve your practice"
    Then page has heading "Get help to improve your practice"
    When clicks on "Help for early years providers"
    Then page has heading "Help for early years providers"
