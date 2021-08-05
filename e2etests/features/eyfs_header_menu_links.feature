Feature: EYFS - Header menu - Links

  Background:

    Given "EYFS service" user
    And user clicks "Reject analytics cookies" button


  Scenario:  Header menu  - Tab - Order - Learning Areas and Sub-areas

    When user proceeds to "Mobile menu learning areas" via "Expressive arts and design" page
    Then page has heading "Expressive arts and design"
# Communication and language
    When on "Help for early years providers" followed by "1" tabs and click
    Then the following "links" are available:
      | Interactions                |
      | Exploring language          |
      | Listening and understanding |
    When on "Communication and language" followed by "1" tabs and click
    Then page has heading "Communication and language"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "3" tabs and click
    Then page has heading "Interactions"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "4" tabs and click
    Then page has heading "Exploring language"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "5" tabs and click
    Then page has heading "Listening and understanding"
# Physical development
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "6" tabs and click
    Then the following "links" are available:
      | Core strength and co-ordination |
      | Gross motor skills              |
      | Fine motor skills               |
    When on "Physical development" followed by "1" tabs and click
    Then page has heading "Physical development"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "4" tabs and click
    Then page has heading "Core strength and co-ordination"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "5" tabs and click
    Then page has heading "Gross motor skills"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "6" tabs and click
    Then page has heading "Fine motor skills"
# Personal, social and emotional development
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "7" tabs and click
    Then the following "links" are available:
      | Emotions      |
      | Sense of self |
      | Relationships |
    When on "Personal, social and emotional development" followed by "1" tabs and click
    Then page has heading "Personal, social and emotional development"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "5" tabs and click
    Then page has heading "Emotions"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "6" tabs and click
    Then page has heading "Sense of self"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "7" tabs and click
    Then page has heading "Relationships"
# Literacy
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "8" tabs and click
    Then the following "links" are available:
      | Reading comprehension |
      | Exploring words   |
      | Writing   |
    When on "Literacy" followed by "1" tabs and click
    Then page has heading "Literacy"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "6" tabs and click
    Then page has heading "Reading comprehension"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "7" tabs and click
    Then page has heading "Exploring words"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "8" tabs and click
    Then page has heading "Writing"
# Mathematics
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "9" tabs and click
    Then the following "links" are available:
      | Numbers                  |
      | Patterns and connections |
      | Spatial reasoning        |
    When on "Mathematics" followed by "1" tabs and click
    Then page has heading "Mathematics"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "7" tabs and click
    Then page has heading "Numbers"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "8" tabs and click
    Then page has heading "Patterns and connections"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "9" tabs and click
    Then page has heading "Spatial reasoning"
# Understanding the world
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "10" tabs and click
    Then the following "links" are available:
      | Personal experiences |
      | Diverse world        |
      | Widening vocabulary  |
    When on "Understanding the world" followed by "1" tabs and click
    Then page has heading "Understanding the world"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "8" tabs and click
    Then page has heading "Personal experiences"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "9" tabs and click
    Then page has heading "Diverse world"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "10" tabs and click
    Then page has heading "Widening vocabulary"
# Expressive arts and design
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "11" tabs and click
    Then the following "links" are available:
      | Imagination and creativity |
      | Self-expression            |
      | Communicating through arts |
    When on "Expressive arts and design" followed by "1" tabs and click
    Then page has heading "Expressive arts and design"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "9" tabs and click
    Then page has heading "Imagination and creativity"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "10" tabs and click
    Then page has heading "Self-expression"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "11" tabs and click
    Then page has heading "Communicating through arts"
# Get help to improve your practice
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "12" tabs and click
    Then the following "links" are available:
      | Curriculum planning                                                                        |
      | Reducing paperwork                                                                         |
#      | Identifying and supporting children with special educational needs and disabilities (SEND) |
      | Oral health                                                                                |
      | Working in partnership with parents and carers                                             |
    When on "Get help to improve your practice" followed by "1" tabs and click
    Then page has heading "Get help to improve your practice"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "10" tabs and click
    Then page has heading "Curriculum planning"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "11" tabs and click
    Then page has heading "Reducing paperwork"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "12" tabs and click
#    Then page has heading "Identifying and supporting children with special educational needs and disabilities (SEND)"
#    When user clicks "Menu" button
#    When on "Help for early years providers" followed by "13" tabs and click
    Then page has heading "Oral health"
    When user clicks "Menu" button
    When on "Help for early years providers" followed by "13" tabs and click
    Then page has heading "Working in partnership with parents and carers"
