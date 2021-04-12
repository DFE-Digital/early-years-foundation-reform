# 4

Feature: EYFS - Help for early years providers - Links

  Background:

    Given "PVI Practitioner" user
    When user proceeds to "Help for early years providers and professionals" page


  Scenario:  Help for early years providers and professionals page body - Links

    Then page has heading "Help for early years providers and professionals"
    And the following "links" are available:
      | Communication and language                  |
      | Physical development                        |
      | Personal, social, and emotional development |
      | Literacy                                    |
      | Mathematics                                 |
      | Understanding the world                     |
      | Expressive arts and design                  |
    And following is "displayed":
      | Information, guidance, practical support and training for delivering the early years foundation stage (EYFS). |
      | Learn about the new changes and what it means for your practice.                                              |


  Scenario:  Help for early years providers and professionals footer - Links

    Then following is "displayed":
      | Get help to improve your practice                            |
      | Use the links below to find out how to improve your practice |
    And the following "links" are available:
      | Planning your curriculum                    |
      | Reducing paperwork                          |
      | Supporting / identifying children with SEND |
      | Oral health                                 |
      | Keeping parents up to date                  |
    Then following is "displayed":
      | Other useful resources                                             |
      | Use the links below to find out other resources that may be useful |
    And the following "links" are available:
      | EYFS Framework         |
      | EYFS Framework support |
      | Development matters    |


  Scenario:  Help for early years providers and professionals - Pandemic notice

    Then following is "displayed":
      | Stay up to date with GOV.UK |
    And the following "links" are available:
      | Sign up to get emails when we change any coronavirus information on the GOV.UK website |


  Scenario:  Help for early years providers and professionals - Social media

    Then following is "displayed":
      | Share this page |
    And the following "links" are available:
      | Facebook  |
      | Pinterest |
      | Whatsapp  |
      | Email     |
      | Twitter   |


  Scenario:  Help for early years providers and professionals - Back button/link

      # GDS https://design-system.service.gov.uk/components/back-link/
      # When not to use this component:
      # Never use the back link component together with breadcrumbs.
      # If necessary, you should do research with your users to learn which they find more helpful in your service.
      #
      # As this landing page does not appear to have a bread crumb then a back/link to previous page may be required
      # Then the following links are "displayed":
      # Then the following links are "not displayed"
      #   | Back |

