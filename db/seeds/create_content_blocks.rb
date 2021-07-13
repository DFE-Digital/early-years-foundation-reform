# rubocop:disable Layout/HeredocIndentation
markdown_for_landing_page = <<-MARKDOWN_FOR_LANDING_PAGE
Get ready for the Early Years Foundation Stage (EYFS) changes in September 2021 with this guidance and practical support.

<p class="govuk-body-l">These resources are for childminders, nursery leaders and pre-school practitioners.</p>
MARKDOWN_FOR_LANDING_PAGE

unless ContentBlock.exists?(name: "help_for_early_years_providers")
  ContentBlock.create! do |u|
    u.name = "help_for_early_years_providers"
    u.description = "Used at the top of the landing page"
    u.markdown = markdown_for_landing_page
  end
end

# Not used at the moment. The styles from gem-c-govspeak are slightly
# different to those used on the landing page. Too fiddly.
markdown_for_areas_of_learning = <<-MARKDOWN_FOR_AREAS_OF_LEARNING
Find information about each area of learning in the EYFS and get ideas for activities you can do with early years children.
MARKDOWN_FOR_AREAS_OF_LEARNING

unless ContentBlock.exists?(name: "areas_of_learning")
  ContentBlock.create! do |u|
    u.name = "areas_of_learning"
    u.description = "Used on the landing page to describe the areas of learning"
    u.markdown = markdown_for_areas_of_learning
  end
end

markdown_for_get_help = <<-MARKDOWN_FOR_GET_HELP_TO_IMPROVE_YOUR_PRACTICE
# Get help to improve your practice

[Overview](http://localhost:3000/get-help-to-improve-your-practice)

[Planning](http://localhost:3000/get-help-to-improve-your-practice/planning)

[Reducing paperwork](http://localhost:3000/get-help-to-improve-your-practice/reducing-paperwork)

[Identifying and supporting children with special educational needs and disability](http://localhost:3000/get-help-to-improve-your-practice/identifying-and-supporting-children-with-special-educational-needs-and-disability)

[Promoting oral health as part of the safeguarding and welfare requirements](http://localhost:3000/get-help-to-improve-your-practice/promoting-oral-health-as-part-of-the-safeguarding-and-welfare-requirements)

[Working in partnership with parents](http://localhost:3000/get-help-to-improve-your-practice/working-in-partnership-with-parents)
MARKDOWN_FOR_GET_HELP_TO_IMPROVE_YOUR_PRACTICE

unless ContentBlock.exists?(name: "get_help_to_improve_your_practice")
  ContentBlock.create! do |u|
    u.name = "get_help_to_improve_your_practice"
    u.description = "Used on the landing page to describe Get Help To Improve Your Practice"
    u.markdown = markdown_for_get_help
  end
end

markdown_for_other_useful_resources = <<-MARKDOWN_FOR_OTHER_USERFUL_RESOURCES
## Other useful resources
[Changes to the early years foundation stage framework](https://www.gov.uk/government/publications/changes-to-the-early-years-foundation-stage-eyfs-framework/changes-to-the-early-years-foundation-stage-eyfs-framework)

[https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2](Statutory framework for the early years foundation stage)

[https://www.gov.uk/government/publications/development-matters--2](Development Matters, non-statutory curriculum guidance for the early years foundation stage)

MARKDOWN_FOR_OTHER_USERFUL_RESOURCES

unless ContentBlock.exists?(name: "other_useful_resources")
  ContentBlock.create! do |u|
    u.name = "other_useful_resources"
    u.description = "Used on the landing page to describe Other Useful Resources"
    u.markdown = markdown_for_other_useful_resources
  end
end

html_for_accessibility = <<-HTML_FOR_ACCESSIBILITY
# Accessibility statement for the Help for early years providers service

This accessibility statement applies to the Help for early years providers service.

This website is run by the Department for Education (DfE). We want as many people as possible to be able to use this website. For example, that means you will be able to:

* change colours, contrast levels and fonts
* zoom in up to 300% without the text spilling off the screen
* navigate the website using just a keyboard
* navigate the website using speech recognition software
* listen to the website using a screen reader (including the most recent versions of JAWS and NVDA)

We’ve also made the website text as simple as possible to understand.

# How accessible this website is

We know some parts of this website aren’t fully accessible:

* screen readers on menu
* colour contrast insufficient for some links when highlighted by Tab
* with IE11 the user needs to actually click links within main content to access areas of learning, clicking surrounding area of a link does not work
* audio description of visual information

We have yet to test:

* voice recognition
* with real users who have accessibility issues to make sure that our service meets their needs


## Feedback and Contact Information

If you need information on this website in a different format like accessible PDF, large print, easy read, audio recording or braille:

* [help_for_early_years_providers@digital.education.gov.uk](mailto:help_for_early_years_providers@digital.education.gov.uk)

We’ll consider your request and get back to you in 5 working days.

## Reporting accessibility problems with this website

We’re always looking to improve the accessibility of this website. If you find any problems that aren’t listed on this page or think we’re not meeting the requirements of the accessibility regulations, contact:

[help_for_early_years_providers@digital.education.gov.uk](mailto:help_for_early_years_providers@digital.education.gov.uk)

## Enforcement procedure

The Equality and Human Rights Commission (EHRC) is responsible for enforcing the accessibility regulations. If you’re not happy with how we respond to your complaint, contact the

[Equality Advisory and Support Service (EASS)](https://www.equalityadvisoryservice.com/)

## Contacting us by phone or visiting us in person

We provide a text relay service for people who are D/deaf, hearing impaired or have a speech impediment.
Our offices have audio induction loops, or if you contact us before your visit we can arrange a British Sign Language (BSL) interpreter.

Contact us:
<a href='mailto:help_for_early_years_providers@digital.education.gov.uk'>
help_for_early_years_providers@digital.education.gov.uk.
</a>

## Technical information about this website’s accessibility

The Department for Education (DfE) is committed to making its website accessible, in accordance with the Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations 2018.

##Compliance Status

This website is partially compliant with the Web Content Accessibility Guidelines version 2.1 AA standard, due to the non-compliances listed below.

## Non Accessible Content

The content listed below is non-accessible for the following reasons:

* screen readers on menu
* colour contrast insufficient for some links when highlighted by Tab
* with IE11 the user needs to actually click links within main content to access areas of learning, clicking surrounding area of a link does not work
* audio description of visual information

We have yet to test:

* voice recognition
* with real users who have accessibility issues to make sure that our service meets their needs

## Non Compliance with the accessibility regulations

Large controls that we have for accessing learning areas do not work on IE11, so the user will need to actually click the learning area link to access areas of learning.

The colour contrast is insufficient for some links when highlighted by Tab.  This does not meet WCAG 2.1 success criterion 1.4.3 (contrast minimum).

We are investigating the audio description of visual information within videos.

We have yet to test:

* voice recognition
* with real users who have accessibility issues to make sure that our service meets their needs

We intend to address the above issues by the end of August 2021.

## Preparation of this accessibility statement

This statement was prepared on 8th June 2021. It was last reviewed on 8th June 2021.

This website was last tested on 7th June 2021. The test was carried out by the Help for early years providers team.

Our approach was to test all pages.

HTML_FOR_ACCESSIBILITY
unless ContentBlock.exists?(name: "accessibility")
  ContentBlock.create! do |u|
    u.name = "accessibility"
    u.description = "Used on the Accessibility page"
    u.markdown = html_for_accessibility
  end
end

# rubocop:enable Layout/HeredocIndentation
