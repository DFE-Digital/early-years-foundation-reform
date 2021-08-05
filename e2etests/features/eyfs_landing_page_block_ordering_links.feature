Feature: EYFS - Landing page - 7 Areas of Learning - Block Ordering of Links

  Background:

    Given "EYFS service" user
    When user proceeds to "7 areas of learning blocks" page


  Scenario:  Seven Areas of Learning page - Block Ordering of Links

    Then page has heading "Help for early years providers"
    And "7 areas of learning block" item "1" is "Communication and language"
    And "7 areas of learning block" item "2" is "Physical development"
    And "7 areas of learning block" item "3" is "Personal, social and emotional development"
    And "7 areas of learning block" item "4" is "Literacy"
    And "7 areas of learning block" item "5" is "Mathematics"
    And "7 areas of learning block" item "6" is "Understanding the world"
    And "7 areas of learning block" item "7" is "Expressive arts and design"
