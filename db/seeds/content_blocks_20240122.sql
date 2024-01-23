-- -------------------------------------------------------------
-- TablePlus 5.8.4(530)
--
-- https://tableplus.com/
--
-- Database: s195p01-hfeyp-koala-psqldb
-- Generation Time: 2024-01-22 11:33:49.7580
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."content_blocks";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS content_blocks_id_seq;

-- Table Definition
CREATE TABLE "public"."content_blocks" (
    "id" int8 NOT NULL DEFAULT nextval('content_blocks_id_seq'::regclass),
    "name" varchar,
    "description" varchar,
    "markdown" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."content_blocks" ("id", "name", "description", "markdown", "created_at", "updated_at") VALUES
(1, 'other_useful_resources', 'Used on the landing page to describe Other Useful Resources', '<h2 class="govuk-heading-l">Other useful resources</h2>
<p class="govuk-body"><a class="govuk-link" href="https://www.gov.uk/government/publications/changes-to-the-early-years-foundation-stage-eyfs-framework/changes-to-the-early-years-foundation-stage-eyfs-framework">Changes to the early years foundation stage framework</a></p>
<p class="govuk-body"><a class="govuk-link" href="https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2">Statutory framework for the early years foundation stage</a></p>
<p class="govuk-body"><a class="govuk-link" href="https://www.gov.uk/government/publications/development-matters--2">Development Matters, non-statutory curriculum guidance for the early years foundation stage</a></p>
<p class="govuk-body"><a class="govuk-link" href="https://www.gov.uk/government/publications/progress-check-at-age-2">Guidance on completing the EYFS progress check at age 2</a></p>

', '2021-07-27 16:22:31.25883', '2022-09-12 15:29:46.901981'),
(2, 'accessibility', 'Used on the Accessibility page', '<h1 class="govuk-heading-xl">Accessibility statement for the Help for early years providers service</h1>

This accessibility statement applies to the Help for early years providers service.

This website is run by the Department for Education (DfE). We want as many people as possible to be able to use this website. For example, that means you will be able to:

* change colours, contrast levels and fonts
* zoom in up to 300% without the text spilling off the screen
* navigate the website using just a keyboard
* navigate the website using speech recognition software
* listen to the website using a screen reader (including the most recent versions of JAWS and NVDA)

We’ve also made the website text as simple as possible to understand.

## How accessible this website is

We know some parts of this website aren’t fully accessible:

* screen readers on menu
* zooming and scaling is disabled on content pages and needs to be fixed
* audio description of visual information

We have yet to test:

* voice recognition
* with real users who have accessibility issues to make sure that our service meets their needs


## Feedback and contact information

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
* zooming and scaling is disabled on content pages and needs to be fixed
* audio description of visual information

We have yet to test:

* voice recognition
* with real users who have accessibility issues to make sure that our service meets their needs

## Non Compliance with the accessibility regulations

We are investigating the audio description of visual information within videos.

We have yet to test:

* voice recognition
* with real users who have accessibility issues to make sure that our service meets their needs

We intend to address the above issues by the end of December 2021.

## Preparation of this accessibility statement

This statement was prepared on 27 September 2021. It was last reviewed on 27 September 2021.

This website was last tested on 7 June 2021. The test was carried out by the Help for early years providers team.

Our approach was to test all pages.

', '2021-07-27 16:22:31.296193', '2021-09-27 15:59:37.182826'),
(3, 'cookies', 'Markdown for the cookies page', '<h1 class="govuk-heading-xl">Cookies</h1>

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

Hotjar Analytics cookies store data about:

* whether you have participated in a Hotjar survey
* the way in which you interact with a page
* what you click on while you are visiting the site

Hotjar sets the following cookies:

###Relating to the user

| Name      | Purpose | 	Expires
| ----------- | ----------- | ----------- |
| _hjSessionUser_2424199	| Helps us track visits from users. Set when a user first lands on a page. Ensures data from subsequent visits to the same site are attributed to the same user ID.	| 365 days
| _hjid	| Help us track users who visit the website multiple times. A unique Hotjar user ID is used to link their visits together.	| 365 days
| _hjFirstSeen	| Identifies a new user’s first session.	| Per session
| _hjUserAttributesHash	| Store user attributes during a user’s browser session so Hotjar knows when an attribute has changed and needs to be updated.	| Per session
| _hjCachedUserAttributes	| Stores user attributes that are sent through the Hotjar identify API whenever the user is not in the sample. Attributes are only saved if the user interacts with a feedback tool.	| Per session
| _hjViewportId	| Stores user viewport details such as size and dimensions.	| Per session

###Relating to the session

| Name      | Purpose | 	Expires
| ----------- | ----------- | ----------- |
| _hjSession_2424199	| Holds current session data. Ensures subsequent requests in the session window are attributed to the same session.	| 30 minutes
| _hjSessionTooLarge	| Causes Hotjar to stop collecting data if a session becomes too large.	| Per session
| _hjSessionRejected	| If present, set to ''1'' for the duration of a user''s session, when Hotjar has rejected the session from connecting to our WebSocket due to server overload.
Applied in extremely rare situations to prevent severe performance issues.	| Per session
| _hjSessionResumed	| Set when a session/recording is reconnected to Hotjar servers after a break in connection.	| Per session
| _hjLocalStorageTest	| Used to check if the Hotjar tracking script can use local browser storage	| Per session
| _hjIncludedInPageviewSample	| Set to determine if a user is included in the data sampling defined by your site''s pageview limit.	| 30 minutes
| _hjIncludedInSessionSample	| Set to determine if a user is included in the data sampling defined by your site''s daily session limit.	| 30 minutes
| _hjAbsoluteSessionInProgress	| Used to detect the first pageview session of a user.
	| 30 minutes
| _hjTLDTest	| We try to store the _hjTLDTest cookie for different URL substring alternatives until it fails. Enables us to try to determine the most generic cookie path to use, instead of page hostname. It means that cookies can be shared across subdomains (where applicable). After this check, the cookie is removed.	| Per session


###Relating to recordings

| Name      | Purpose | 	Expires
| ----------- | ----------- | ----------- |
| _hjRecordingEnabled	| Set when a Recording starts. Read when the Recording module is initialised to see if the user is already in a recording in a particular session.	| Per session
| _hjRecordingLastActivity	| Set in Session storage as opposed to cookies. Updated when a user recording starts and when data is sent through the WebSocket (the user performs an action that Hotjar records).	| Per session


###Relating to feedback and survey tools

| Name      | Purpose | 	Expires
| ----------- | ----------- | ----------- |
| _hjClosedSurveyInvites	| Tell us whether a Hotjar survey invite has been closed to stop it displaying again	| 365 days
| _hjDonePolls	| Tell us whether a Hotjar feedback poll has been completed to stop the same poll reappearing	| 365 days
| _hjMinimizedPolls	| Keeps Hotjar feedback poll widgets minimised (once minimised by the user) when the user navigates through the website	| 365 days
| _hjShownFeedbackMessage	| Set when a user minimises or completes a Hotjar feedback survey. The survey will stay minimised if the user navigates to a page where it is set to show	| 365 days
', '2021-07-27 16:22:31.309243', '2022-11-02 14:50:27.761908'),
(4, 'disclaimer', 'For the disclaimer page', '<h1 class="govuk-heading-xl">Disclaimer</h1>

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


', '2021-07-27 16:22:31.321307', '2021-07-27 16:22:31.321307'),
(5, 'contact_us', 'Markdown for the Contact Us page', '<h1 class="govuk-heading-xl">Contact us</h1>

For more information about Help for early years providers, email us:

<a class="govuk-link email" href="mailto:help_for_early_years_providers@digital.education.gov.uk">
  help_for_early_years_providers@digital.education.gov.uk
</a>

We aim to respond within 2 working days.

', '2021-07-27 16:22:31.337495', '2021-07-27 16:22:31.337495'),
(6, 'landing-page-introduction', 'The text near the top of the landing page ', '<h1 class="govuk-heading-xl govuk-!-margin-bottom-4">Help for early years providers</h1>
<p class="govuk-body-l">The Early Years Foundation Stage (EYFS) has changed. Find guidance and practical support to help you with the changes.</p>
<p class="govuk-body-l">These resources are for childminders, nursery leaders and pre-school practitioners.</p>', '2021-08-31 15:56:28.684513', '2021-09-01 14:47:47.085602'),
(7, 'landing_page_introduction', 'Landing page introduction', '<h1 class="govuk-heading-xl govuk-!-margin-bottom-4">Help for early years providers</h1>
<p class="govuk-body-l">Guidance for people who work in early years, from the Department for Education.</p>

<div class=''govuk-grid-row''>
  <div class=''govuk-grid-column-full''>
    <div class=''light-grey-box''>
      <h1 class=''govuk-heading-l''>Early years child development training</h1>
      <p class=''govuk-body''>This free, online training provides an overview of child development and practical advice for supporting children in your setting.</p>
      <p class=''govuk-body''><a class="govuk-link" href="https://child-development-training.education.gov.uk/?utm_source=hfeyp&utm_medium=referral&utm_campaign=link">Learn more and enrol</a></p>  
    </div>
  </div>
</div>
', '2021-10-14 16:00:46.909135', '2022-11-28 13:41:38.600364'),
(8, 'test_block', 'this is a test block **edited**', 'this is the markdown for the test block', '2024-01-05 10:50:19.877453', '2024-01-05 10:50:54.253082');
