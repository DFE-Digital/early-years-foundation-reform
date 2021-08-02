# Test Automation (Functional)

Two parts:
- Service (7 areas of landing ordering, left menu pane ordering, previous / next buttons, header and footer links, page headings, number times a link appears,  mobile menu)
- CMS 
(Administrator)

The support/env.rb file can define Environment / URL for tests (ENV_URL)

External Environment variables for CMS Administration:
- ENV['USER_ADMIN'] 'email' in users table (user set as Administrator)
- ENV['USER_ADMINP'] 'encrypted_password' in users table

External Environment variables for Service:
- ENV['SERVICE_URL']
External Environment variables for CMS:
- ENV['CMS_URL']

### To run in the terminal

./script/cucumber ./e2etests/features --format pretty --color -r e2etests/features


## Pre-requisites

### Windows

install Ruby
install cucumber
install drivers such as Chrome
install IDE

### Mac O/S
brew install ruby
brew install cucumber
brew cask install chromedriver  - (This automatically installs the latest version so you may need to also update your chrome browser, more info - https://chromedriver.chromium.org/downloads)
install IDE

## Project 

### within 'e2etests' folder of https://github.com/DFE-Digital/early-years-foundation-reform

## Features as @ 15 April 2021

#### Feature: EYFS - Help for early years providers - Landing page [_eyfs_landing_page.feature  3 scenarios (3 passed) 16 steps (16 passed)_]

###### Scenario:  Help for early years providers - Learning areas - Links
###### Scenario:  Help for early years providers - Get help to improve your practice - Links
###### Scenario:  Help for early years providers - Other useful resources - Links

#### Feature: EYFS - Landing page - 7 Areas of Learning - Block Ordering of Links [_eyfs_landing_page_block_ordering_links.feature  1 scenario (1 passed) 10 steps (10 passed) _]

######   Scenario:  Seven Areas of Learning page - Block Ordering of Links

#### Feature: EYFS - Left-menu - Links [_eyfs_left_menu_links.feature  3 scenarios (3 passed) 93 steps (93 passed)_]

###### Scenario:  Left-menu - Sub-areas - Links
###### Scenario:  Left-menu - Tab - Order - Learning Areas and Sub-areas
###### Scenario:  Left-menu - Tab - Order - Get help to improve your practice

#### Feature: EYFS - Navigation to Cookie page [_eyfs_navigation_to_cookies_page.feature  35 scenarios (35 passed) 171 steps (171 passed)_]

###### Scenario:  Landing page - Cookie link navigation
###### Scenario:  Communication and Language page - Cookie link navigation
###### Scenario:  Communication and Language - Interactions - Cookie link navigation
###### Scenario:  Communication and Language - Exploring Language - Cookie link navigation
###### Scenario:  Communication and Language - Listening and Understanding - Cookie link navigation
###### Scenario:  Physical Development - Cookie link navigation
###### Scenario:  Physical Development - Core Strength and Co-ordination - Cookie link navigation
###### Scenario:  Physical Development - Gross Motor Skills - Cookie link navigation
###### Scenario:  Physical Development - Fine Motor Skills - Cookie link navigation           
###### Scenario:  Personal, Social and Emotional Development - Cookie link navigation
###### Scenario:  Personal, Social and Emotional Development - Emotions - Cookie link navigation
###### Scenario:  Personal, Social and Emotional Development - Sense of Self - Cookie link navigation
###### Scenario:  Personal, Social and Emotional Development - Relationships - Cookie link navigation
###### Scenario:  Literacy - Cookie link navigation
###### Scenario:  Literacy - Comprehension - Cookie link navigation
###### Scenario:  Literacy - Word reading - Cookie link navigation
###### Scenario:  Literacy - Writing - Cookie link navigation  
###### Scenario:  Mathematics - Cookie link navigation
###### Scenario:  Mathematics - Numbers - Cookie link navigation
###### Scenario:  Mathematics - Patterns and Connections - Cookie link navigation
###### Scenario:  Mathematics - Spatial Reasoning - Cookie link navigation
###### Scenario:  Understanding the World - Cookie link navigation
###### Scenario:  Understanding the World - Personal Experiences - Cookie link navigation
###### Scenario:  Understanding the World - Diverse World - Cookie link navigation
###### Scenario:  Understanding the World - Widening vocabulary - Cookie link navigation
###### Scenario:  Expressive Arts and Design - Cookie link navigation
###### Scenario:  Expressive Arts and Design - Imagination and Creativity - Cookie link navigation
###### Scenario:  Expressive Arts and Design - Self-expression - Cookie link navigation
###### Scenario:  Expressive Arts and Design - Communicating through arts - Cookie link navigation
###### Scenario:  Get help to improve your practice - Cookie link navigation  
###### Scenario:  Get help to improve your practice - Curriculum Planning - Cookie link navigation
###### Scenario:  Get help to improve your practice - Reducing Paperwork - Cookie link navigation
###### Scenario:  Get help to improve your practice - SEND - Cookie link navigation
###### Scenario:  Get help to improve your practice - Oral Health - Cookie link navigation
###### Scenario:  Get help to improve your practice - Working in partnership with Parents and Carers - Cookie link navigation    
###### Scenario:  Accessibility statement - Cookie link navigation      

#### Feature: EYFS - Communication and Language - Links [_eyfs_p1_communication_and_language_links.feature  4 scenarios (4 passed) 17 steps (17 passed)_]

###### Scenario:  Communication and Language page - Links
#### Scenario:  Communications and Language page - Link - Listening and Understanding
#### Scenario:  Communications and Language page - Link - Exploring Language
#### Scenario:  Communications and Language page - Link - Interactions
      
#### Feature: EYFS - Physical Development - Links [_eyfs_p2_physical_development_links.feature  4 scenarios (4 passed) 17 steps (17 passed)_]

###### Scenario:  Physical Development page - Links
###### Scenario:  Physical Development page - Link - Core Strength and Co-ordination  
###### Scenario:  Physical Development page - Link - Gross Motor Skills
###### Scenario:  Physical Development page - Link - Fine Motor Skills
    
#### Feature: EYFS - Personal, Social and Emotional Development - Links [_eyfs_p3_personal_social_and_emotional_development_links.feature  4 scenarios (4 passed) 17 steps (17 passed)_]

###### Scenario:  Personal, Social and Emotional Development page - Links
###### Scenario:  Personal, Social and Emotional Development page - Link - Emotions
###### Scenario:  Personal, Social and Emotional Development page - Link - Sense of self
######   Scenario:  Personal, Social and Emotional Development page - Link - Relationships

#### Feature: EYFS - Literacy - Links [_eyfs_p4_literacy_links.feature  4 scenarios (4 passed) 17 steps (17 passed)_]

###### Scenario:  Literacy page - Links
###### Scenario:  Literacy page - Link - Comprehension
###### Scenario:  Literacy page - Link - Pre-reading (Word reading)
###### Scenario:  Literacy page - Link - Pre-writing (Writing)

#### Feature: EYFS - Maths - Links [_eyfs_p5_mathematics_links.feature  4 scenarios (4 passed) 17 steps (17 passed)_]

###### Scenario:  Maths page - Links
###### Scenario:  Maths page - Link - Numbers
###### Scenario:  Maths page - Link - Patterns and Connections
###### Scenario:  Maths page - Link - Spatial Reasoning

#### Feature: EYFS - Understanding the World - Links [_eyfs_p6_understanding_the_world_links.feature  4 scenarios (4 passed) 17 steps (17 passed)_]

###### Scenario:  Understanding the World page - Links
###### Scenario:  Understanding the World page - Link - Personal Experiences
###### Scenario:  Understanding the World page - Link - Diverse World
###### Scenario:  Understanding the World page - Link - Widening Vocabulary

#### Feature: EYFS - Expressive Arts and Design - Links [_eyfs_p7_expressive_arts_and_design_links.feature  4 scenarios (4 passed) 17 steps (17 passed)_]

###### Scenario:  Expressive Arts and Design page - Links
###### Scenario:  Expressive Arts and Design page - Link - Imagination and Creativity
###### Scenario:  Expressive Arts and Design page - Link - Self Expression
###### Scenario:  Expressive Arts and Design page - Link - Communicating Through Arts

#### Feature: EYFS - Previous and Next - Links [_eyfs_previous_next_links.feature  8 scenarios (8 passed)  115 steps (115 passed)_]

###### Scenario:  Previous and Next Links - Communication and Language
###### Scenario:  Previous and Next Links - Physical Development
###### Scenario:  Previous and Next Links - Personal, Social and Emotional Development
###### Scenario:  Previous and Next Links - Literacy
###### Scenario:  Previous and Next Links - Mathematics
###### Scenario:  Previous and Next Links - Understanding the World
###### Scenario:  Previous and Next Links - Expressive Arts and Design
###### Scenario:  Previous and Next Links - Get help to improve your practice
              
#### Feature: EYFS - Help for early years providers - Header [_eyfs_service_header.feature  10 scenarios (10 passed) 57 steps (57 passed)_]

###### Scenario:  Help for early years providers - Header - Govt - Link
###### Scenario: Help for early years providers - Header - Service Name - Link
###### Scenario: Help for early years providers - Service Name Link - Communication and Language
###### Scenario: Help for early years providers - Service Name Link - Physical Development
###### Scenario: Help for early years providers - Service Name Link - Personal, Social and Emotional Development
###### Scenario: Help for early years providers - Service Name Link - Literacy
###### Scenario: Help for early years providers - Service Name Link - Mathematics
###### Scenario: Help for early years providers - Service Name Link - Understanding the World
###### Scenario: Help for early years providers - Service Name Link - Expressive Arts and Design
###### Scenario: Help for early years providers - Service Name Link - Get help to improve your practice      
        
## Cucumber Tests

### To run
- Run manually in IDE
- Command line
- Intention for these integration / e2e tests to run in pipeline

#### IDE
Right click on 'Feature' and run 
Or 
Run - Edit Configurations (depending on IDE)

#### Command Line  
cucumber --color -r 'e2etestname'.feature

## TODO Robocop compliance
