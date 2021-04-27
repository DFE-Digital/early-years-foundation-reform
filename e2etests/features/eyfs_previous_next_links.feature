Feature: EYFS - Previous and Next - Links

  Background:

    Given "EYFS service" user
    When user proceeds to "Communication and language" page


  Scenario:  Previous and Next Links - Communication and Language

    When clicks on "Communication and language"
    Then "Previous page" has value "Working in partnership with parents and carers"
    And "Next page" has value "Interactions"
    When clicks on "Interactions"
    Then "Previous page" has value "Communication and language"
    And "Next page" has value "Exploring language"
    When clicks on "Exploring language"
    Then "Previous page" has value "Interactions"
    And "Next page" has value "Listening and understanding"
    When clicks on "Listening and understanding"
    Then "Previous page" has value "Exploring language"
    And "Next page" has value "Physical development"


  Scenario:  Previous and Next Links - Physical Development

    When clicks on "Physical development"
    Then "Previous page" has value "Listening and understanding"
    And "Next page" has value "Core strength and co-ordination"
    When clicks on "Core strength and co-ordination"
    Then "Previous page" has value "Physical development"
    And "Next page" has value "Gross motor skills"
    When clicks on "Gross motor skills"
    Then "Previous page" has value "Core strength and co-ordination"
    And "Next page" has value "Fine motor skills"
    When clicks on "Fine motor skills"
    Then "Previous page" has value "Gross motor skills"
    And "Next page" has value "Personal, social and emotional development"


  Scenario:  Previous and Next Links - Personal, Social and Emotional Development

    When clicks on "Personal, social and emotional development"
    Then "Previous page" has value "Fine motor skills"
    And "Next page" has value "Emotions"
    When clicks on "Emotions"
    Then "Previous page" has value "Personal, social and emotional development"
    And "Next page" has value "Sense of self"
    When clicks on "Sense of self"
    Then "Previous page" has value "Emotions"
    And "Next page" has value "Relationships"
    When clicks on "Relationships"
    Then "Previous page" has value "Sense of self"
    And "Next page" has value "Literacy"


  Scenario:  Previous and Next Links - Literacy

    When clicks on "Literacy"
    Then "Previous page" has value "Relationships"
    And "Next page" has value "Comprehension"
    When clicks on "Comprehension"
    Then "Previous page" has value "Literacy"
    And "Next page" has value "Pre-reading"
    When clicks on "Pre-reading"
    Then "Previous page" has value "Comprehension"
    And "Next page" has value "Pre-writing"
    When clicks on "Pre-writing"
    Then "Previous page" has value "Pre-reading"
    And "Next page" has value "Mathematics"


  Scenario:  Previous and Next Links - Mathematics

    When clicks on "Mathematics"
    Then "Previous page" has value "Pre-writing"
    And "Next page" has value "Numbers"
    When clicks on "Numbers"
    Then "Previous page" has value "Mathematics"
    And "Next page" has value "Patterns and connections"
    When clicks on "Patterns and connections"
    Then "Previous page" has value "Numbers"
    And "Next page" has value "Spatial reasoning"
    When clicks on "Spatial reasoning"
    Then "Previous page" has value "Patterns and connections"
    And "Next page" has value "Understanding the world"


  Scenario:  Previous and Next Links - Understanding the World

    When clicks on "Understanding the world"
    Then "Previous page" has value "Spatial reasoning"
    And "Next page" has value "Personal experiences"
    When clicks on "Personal experiences"
    Then "Previous page" has value "Understanding the world"
    And "Next page" has value "Diverse world"
    When clicks on "Diverse world"
    Then "Previous page" has value "Personal experiences"
    And "Next page" has value "Widening vocabulary"
    When clicks on "Widening vocabulary"
    Then "Previous page" has value "Diverse world"
    And "Next page" has value "Expressive arts and design"


  Scenario:  Previous and Next Links - Expressive Arts and Design

    When clicks on "Expressive arts and design"
    Then "Previous page" has value "Widening vocabulary"
    And "Next page" has value "Imagination and creativity"
    When clicks on "Imagination and creativity"
    Then "Previous page" has value "Expressive arts and design"
    And "Next page" has value "Self-expression"
    When clicks on "Self-expression"
    Then "Previous page" has value "Imagination and creativity"
    And "Next page" has value "Communicating through arts"
    When clicks on "Communicating through arts"
    Then "Previous page" has value "Self-expression"
    And "Next page" has value "Get help to improve your practice"


  Scenario:  Previous and Next Links - Get help to improve your practice

    When clicks on "Get help to improve your practice"
    Then "Previous page" has value "Communicating through arts"
    And "Next page" has value "Curriculum planning"
    When clicks on "Curriculum planning"
    Then "Previous page" has value "Get help to improve your practice"
    And "Next page" has value "Reducing paperwork"
    When clicks on "Reducing paperwork"
    Then "Previous page" has value "Curriculum planning"
    # And "Next page" has value "Identifying and supporting children with special educational needs and disability"
    # When clicks on "Identifying and supporting children with special educational needs and disability"
    #Then "Previous page" has value "Reducing paperwork"
    And "Next page" has value "Oral health"
    When clicks on "Oral health"
    Then "Previous page" has value "Reducing paperwork"
    And "Next page" has value "Working in partnership with parents and carers"
    When clicks on "Working in partnership with parents and carers"
    Then "Previous page" has value "Oral health"
    And "Next page" has value "Communication and language"