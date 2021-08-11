# rubocop:disable Layout/HeredocIndentation
html_for_accessibility = <<-HTML_FOR_ACCESSIBILITY
<h1 class="govuk-heading-xl">Accessibility statement for the Help for early years providers service</h1>

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

<a class="govuk-link email" href="mailto:help_for_early_years_providers@digital.education.gov.uk">
  help_for_early_years_providers@digital.education.gov.uk
</a>

We’ll consider your request and get back to you in 5 working days.

## Reporting accessibility problems with this website

We’re always looking to improve the accessibility of this website. If you find any problems that aren’t listed on this page or think we’re not meeting the requirements of the accessibility regulations, contact:

<a class="govuk-link email" href="mailto:help_for_early_years_providers@digital.education.gov.uk">
  help_for_early_years_providers@digital.education.gov.uk
</a>

## Enforcement procedure

The Equality and Human Rights Commission (EHRC) is responsible for enforcing the accessibility regulations. If you’re not happy with how we respond to your complaint, contact the

[Equality Advisory and Support Service (EASS)](https://www.equalityadvisoryservice.com/)

## Contacting us by phone or visiting us in person

We provide a text relay service for people who are D/deaf, hearing impaired or have a speech impediment.
Our offices have audio induction loops, or if you contact us before your visit we can arrange a British Sign Language (BSL) interpreter.

Contact us:
<a class="govuk-link email" href="mailto:help_for_early_years_providers@digital.education.gov.uk">
  help_for_early_years_providers@digital.education.gov.uk
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

markdown_for_cookies = <<-MARKDOWN_FOR_COOKIES_PAGE
<h1 class="govuk-heading-xl">Cookies</h1>

Cookies are small files saved on your phone, tablet or computer when you visit a website.

We use cookies to make this site work and collect information about how you use our service.

## Essential cookies

Essential cookies keep your information secure while you use Help for early years providers. We do not need to ask permission to use them.

| Name      | Purpose | 	Expires
| ----------- | ----------- | ----------- |
| track_analytics      | Saves your cookie consent settings       |6 months|
| _help_for_early_years_provider_session	|Stores session data	|Session|

## Analytics cookies (optional)

With your permission, we use Google Analytics and Hotjar software to collect anonymised data about how you use Help for early years providers. This information helps us to improve our service.

Google is not allowed to use or share our analytics data with anyone.

Google Analytics stores anonymised information about:

* how you got to Help for early years providers
* the pages you visit on Help for early years providers and how long you spend on them
* any errors you see while using Help for early years providers

Google Analytics sets the following cookies:

| Name      | Purpose | 	Expires
| ----------- | ----------- | ----------- |
| _ga	| Checks if you’ve used Help for early years providers before. This helps us count how many people visit our site | 2 years
| _gid	| Checks if you’ve visited Help for early years providers before. This helps us count how many people visit our site	| 24 hours
| _gat_UA-147538067-8	|Checks if you’ve used Help for early years providers before. This helps us count how many people visit our site.	| 1 minute|

Hotjar Analytic cookies store data about:

* whether you have participated in a Hotjar survey
* the way in which you interact with a page
* what you click on while you are visiting the site

Hotjar sets the following cookies:

| Name      | Purpose | 	Expires
| ----------- | ----------- | ----------- |
| _hjClosedSurveyInvites	| Tell us whether a Hotjar survey invite has been closed to stop it displaying again	| 1 year
| _hjDonePolls	| Tell us whether a Hotjar feedback poll has been completed to stop the same poll reappearing	| 1 year
| _hjMinimizedPolls	| Keep Hotjar feedback poll widgets minimised (once minimised by the user) when the user navigates through the website	| 1 year
| _hjDoneTestersWidgets	| Set when a user submits information in the Hotjar recruit user testers widget. They stop the form reappearing once it has been completed	| 1 year
| _hjIncludedInSample	| Lets Hotjar know whether a user is included in the sample for tracking user journeys to important pages on the website	| 1 year
| _hjShownFeedbackMessage	| Set when a user minimises or completes a Hotjar feedback survey. The survey will stay minimised if the user navigates to a page where it is set to show	| 1 year
| _hjid	| Help us track users who visit the website multiple times. A unique Hotjar user ID is used to link their visits together	| 1 year
| _hjRecordingLastActivity	| Updated when a user recording starts and when a user performs an action on a page that Hotjar records. Found in sessionStorage rather than cookies	| Per session
| _hjTLDTest	| Stored temporarily and used to determine the root (or top-level) domain so that tracking works on all pages	| Per session
| _hjUserAttributesHash	| Store user attributes during a user’s browser session so Hotjar knows when an attribute has changed and needs to be updated	| Per session
| _hjCachedUserAttributes	| Store user attributes that are sent through the Hotjar identify API whenever the user is not in the sample. Attributes are only saved if the user interacts with a feedback tool	| Per session
| _hjLocalStorageTest	| Used to check if the Hotjar tracking script can use local browser storage	| Per session

MARKDOWN_FOR_COOKIES_PAGE

unless ContentBlock.exists?(name: "cookies")
  ContentBlock.create! do |u|
    u.name = "cookies"
    u.description = "Markdown for the cookies page"
    u.markdown = markdown_for_cookies
  end
end

markdown_for_disclaimer_page = <<-MARKDOWN_FOR_DISCLAIMER_PAGE
<h1 class="govuk-heading-xl">Disclaimer</h1>

## Linking from help for early years providers

Help for early years providers links to websites that are managed by other government departments and agencies, service providers or other organisations. This includes links in the ‘other activities’ sections of our pages. We do not have any control over the content on these websites.

We’re not responsible for:

* the protection of any information you give to these websites
* any loss or damage that may come from your use of these websites, or any other websites they link to

Linking to a website does not constitute an endorsement of that website by the Department for Education or any other government department or agency.

You do not have to use the external resources we link to. The lists of external resources are not exhaustive.

You agree to release us from any claims or disputes that may come from using these websites.

You should read all terms and conditions, privacy policies and end user licences that relate to these websites before you use them.

Should you have a concern about the content of a site we link to please email

<a class="govuk-link email" href="mailto:help_for_early_years_providers@digital.education.gov.uk">
  help_for_early_years_providers@digital.education.gov.uk
</a>


MARKDOWN_FOR_DISCLAIMER_PAGE

unless ContentBlock.exists?(name: "disclaimer")
  ContentBlock.create! do |u|
    u.name = "disclaimer"
    u.description = "For the disclaimer page"
    u.markdown = markdown_for_disclaimer_page
  end
end

markdown_for_contact_us = <<-MARKDOWN_FOR_CONTACT_US
<h1 class="govuk-heading-xl">Contact us</h1>

For more information about Help for early years providers, email us:

<a class="govuk-link email" href="mailto:help_for_early_years_providers@digital.education.gov.uk">
  help_for_early_years_providers@digital.education.gov.uk
</a>

We aim to respond within 2 working days.

MARKDOWN_FOR_CONTACT_US

unless ContentBlock.exists?(name: "contact_us")
  ContentBlock.create! do |u|
    u.name = "contact_us"
    u.description = "Markdown for the Contact Us page"
    u.markdown = markdown_for_contact_us
  end
end

# rubocop:enable Layout/HeredocIndentation
