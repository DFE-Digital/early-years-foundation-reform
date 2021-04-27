Feature: EYFS - Help for early years providers - Landing page

  Background:

    Given "EYFS Service" user
    When user proceeds to "Help for early years providers" page


  Scenario:  Help for early years providers - Learning areas - Links

    Then page has heading "Help for early years providers"
    And page has "h2" heading "Areas of learning"
    And page has "h2" heading "Get help to improve your practice"
    And page has "h2" heading "Other useful resources"
    And the following "links" are available:
      | Communication and language                 |
      | Physical development                       |
      | Personal, social and emotional development |
      | Literacy                                   |
      | Mathematics                                |
      | Understanding the world                    |
      | Expressive arts and design                 |
    And following is "displayed":
      | Information, guidance and practical support for delivering the early years foundation stage (EYFS) framework.               |
      | Find information about each area of learning in the EYFS and get ideas for activities you can do with early years children. |


  Scenario:  Help for early years providers - Get help to improve your practice - Links

    Then page has "h2" heading "Get help to improve your practice"
# Obsolete     | Use the links below to find out how to improve your practice |
    And the following "links" are available:
      | Overview                                                                                   |
      | Curriculum planning                                                                        |
      | Reducing paperwork                                                                         |
#      | Identifying and supporting children with special educational needs and disabilities (SEND) |
      | Oral health                                                                                |
      | Working in partnership with parents and carers                                             |


  Scenario:  Help for early years providers - Other useful resources - Links

    Then page has "h2" heading "Other useful resources"
# Obsolete      | Use the links below to find out other resources that may be useful |
    And the following "links" are available:
      | Changes to the early years foundation stage framework                                       |
      | Statutory framework for the early years foundation stage                                    |
      | Development Matters, non-statutory curriculum guidance for the early years foundation stage |


# Obsolete
#  Scenario:  Help for early years providers - Pandemic notice
#
#    Then following is "displayed":
#      | Stay up to date with GOV.UK |
#    And the following "links" are available:
#      | Sign up to get emails when we change any coronavirus information on the GOV.UK website |

# Obsolete
#  Scenario:  Help for early years providers - Social media
#
#    Then following is "displayed":
#      | Share this page |
#    And the following "links" are available:
#      | Facebook  |
#      | Pinterest |
#      | Whatsapp  |
#      | Email     |
#      | Twitter   |
