Feature: EYFS - Left-menu - Links

  Background:

    Given "EYFS service" user


  Scenario:  Left-menu - Sub-areas - Links

    When user proceeds to "Left-menu sub-areas" via "Communication and language" page
    Then "Left menu sub-area" item "1" is "Interactions"
    Then "Left menu sub-area" item "2" is "Exploring language"
    Then "Left menu sub-area" item "3" is "Listening and understanding"
    Then "Left menu sub-area" item "4" is "Core strength and co-ordination"
    Then "Left menu sub-area" item "5" is "Gross motor skills"
    Then "Left menu sub-area" item "6" is "Fine motor skills"
    Then "Left menu sub-area" item "7" is "Emotions"
    Then "Left menu sub-area" item "8" is "Sense of self"
    Then "Left menu sub-area" item "9" is "Relationships"
    Then "Left menu sub-area" item "10" is "Comprehension"
    Then "Left menu sub-area" item "11" is "Pre-reading"
    Then "Left menu sub-area" item "12" is "Pre-writing"
    Then "Left menu sub-area" item "13" is "Numbers"
    Then "Left menu sub-area" item "14" is "Patterns and connections"
    Then "Left menu sub-area" item "15" is "Spatial reasoning"
    Then "Left menu sub-area" item "16" is "Personal experiences"
    Then "Left menu sub-area" item "17" is "Diverse world"
    Then "Left menu sub-area" item "18" is "Widening vocabulary"
    Then "Left menu sub-area" item "19" is "Imagination and creativity"
    Then "Left menu sub-area" item "20" is "Self-expression"
    Then "Left menu sub-area" item "21" is "Communicating through arts"


  Scenario:  Left-menu - Tab - Order - Learning Areas and Sub-areas

    When user proceeds to "Communication and language" page
    When on "Home" followed by "2" tabs and click
    Then page has heading "Communication and language"
    When on "Home" followed by "3" tabs and click
    Then page has heading "Interactions"
    When on "Home" followed by "5" tabs and click
    Then page has heading "Exploring language"
    When on "Home" followed by "6" tabs and click
    Then page has heading "Listening and understanding"
    When on "Home" followed by "7" tabs and click
    Then page has heading "Physical development"
    When on "Home" followed by "7" tabs and click
    Then page has heading "Core strength and co-ordination"
    When on "Home" followed by "9" tabs and click
    Then page has heading "Gross motor skills"
    When on "Home" followed by "10" tabs and click
    Then page has heading "Fine motor skills"
    When on "Home" followed by "11" tabs and click
    Then page has heading "Personal, social and emotional development"
    When on "Home" followed by "11" tabs and click
    Then page has heading "Emotions"
    When on "Home" followed by "13" tabs and click
    Then page has heading "Sense of self"
    When on "Home" followed by "14" tabs and click
    Then page has heading "Relationships"
    When on "Home" followed by "15" tabs and click
    Then page has heading "Literacy"
    When on "Home" followed by "15" tabs and click
    Then page has heading "Comprehension"
    When on "Home" followed by "17" tabs and click
    Then page has heading "Pre-reading"
    When on "Home" followed by "18" tabs and click
    Then page has heading "Pre-writing"
    When on "Home" followed by "19" tabs and click
    Then page has heading "Mathematics"
    When on "Home" followed by "19" tabs and click
    Then page has heading "Numbers"
    When on "Home" followed by "21" tabs and click
    Then page has heading "Patterns and connections"
    When on "Home" followed by "22" tabs and click
    Then page has heading "Spatial reasoning"
    When on "Home" followed by "23" tabs and click
    Then page has heading "Understanding the world"
    When on "Home" followed by "23" tabs and click
    Then page has heading "Personal experiences"
    When on "Home" followed by "25" tabs and click
    Then page has heading "Diverse world"
    When on "Home" followed by "26" tabs and click
    Then page has heading "Widening vocabulary"
    When on "Home" followed by "27" tabs and click
    Then page has heading "Expressive arts and design"
    When on "Home" followed by "27" tabs and click
    Then page has heading "Imagination and creativity"
    When on "Home" followed by "29" tabs and click
    Then page has heading "Self-expression"
    When on "Home" followed by "30" tabs and click
    Then page has heading "Communicating through arts"


  Scenario:  Left-menu - Tab - Order - Get help to improve your practice

    When user proceeds to "Communication and language" page
    When on "Home" followed by "30" tabs and click
    Then page has heading "Get help to improve your practice"
    When on "Home" followed by "31" tabs and click
    Then page has heading "Curriculum planning"
    When on "Home" followed by "33" tabs and click
    Then page has heading "Reducing paperwork"
    When on "Home" followed by "34" tabs and click
#    Then page has heading "Identifying and supporting children with special educational needs and disabilities (SEND)"
#    When on "Home" followed by "35" tabs and click
    Then page has heading "Oral health"
    When on "Home" followed by "35" tabs and click
    Then page has heading "Working in partnership with parents and carers"
