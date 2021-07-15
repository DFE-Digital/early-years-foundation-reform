# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
we do not currently follow Semantic Versioning or track version numbers.


## [Release 1.5.0]

### Fixed
  [PR-338]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/338)
  [HFEYP-452](https://dfedigital.atlassian.net/browse/HFEYP-452)
  Banner displayed after cookies set because of cache control - only use cache once cookie is set

  [PR-339]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/339)
  [HFEYP-498](https://dfedigital.atlassian.net/browse/HFEYP-498)
  Add order list to error summary, to ensure they display in the proper order

  [PR-338]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/338)
  [HFEYP-452](https://dfedigital.atlassian.net/browse/HFEYP-452)
  Cache pages only if the cookie has been set


  [PR-337]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/337)
  [HFEYP-496](https://dfedigital.atlassian.net/browse/HFEYP-496)
  Remove duplicate main landmarks

  [PR-330]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/330)
  [PR-336]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/336)
  [PR-335]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/335)
  [HFEYP-242](https://dfedigital.atlassian.net/browse/HFEYP-242)
  Add link checker, remove mechanize and then remove/revert link checker

  [PR-334]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/334)
  [HFEYP-197](https://dfedigital.atlassian.net/browse/HFEYP-197)
  Add polyfill for unsupported forEach function (in IE11)

  [PR-333]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/333)
  [HFEYP-397](https://dfedigital.atlassian.net/browse/HFEYP-397)
  Add correct classes and styling to mobile menu items

## [Release 1.4.0]

### Dependencies updated
active_storage_validations 0.9.4 -> 0.9.5
audited 5.0.0 -> 5.0.1
axe-core-capybara 4.2.0 -> 4.2.1
axe-core-rspec 4.2.0 -> 4.2.1
axe-core-selenium 4.2.0 -> 4.2.1
govuk_design_system_formbuilder 2.6.0 -> 2.7.0
rails 6.1.3.2 -> 6.1.4

### Added
  [PR-307]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/307 )
  [HFEYP-465](https://dfedigital.atlassian.net/browse/HFEYP-465)
  Fix user without (or with invalid) role permissions
  [HFEYP-467](https://dfedigital.atlassian.net/browse/HFEYP-467)
  Use GDS styling (sentence case)
  [HFEYP-451](https://dfedigital.atlassian.net/browse/HFEYP-451)
  Javascript disabled message
  [HFEYP-466](https://dfedigital.atlassian.net/browse/HFEYP-466)
  Proper error messages
  [HFEYP-468](https://dfedigital.atlassian.net/browse/HFEYP-468)
  Email address validation
  [HFEYP-472](https://dfedigital.atlassian.net/browse/HFEYP-472)
  Correct roles

  [PR-302]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/302)
  [HFEYP-430](https://dfedigital.atlassian.net/browse/HFEYP-430)
  Create user administration page and components
  [HFEYP-439](https://dfedigital.atlassian.net/browse/HFEYP-439)
  Add new user
  [HFEYP-429](https://dfedigital.atlassian.net/browse/HFEYP-429)
  Add 'Admin' button to service headers
  [HFEYP-432](https://dfedigital.atlassian.net/browse/HFEYP-432)
  Edit user details
  [HFEYP-431](https://dfedigital.atlassian.net/browse/HFEYP-431)
  Delete user function
  [HFEYP-441](https://dfedigital.atlassian.net/browse/HFEYP-441)
  On-screen confirmation

  [PR-303]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/303)
  [HFEYP-443](https://dfedigital.atlassian.net/browse/HFEYP-443)
  Ensure at least one admin at all times

  [PR-304]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/304)
  No HFEYP ticket
  Adding specs for user administration

  [PR-306]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/306)
  [HFEYP-447](https://dfedigital.atlassian.net/browse/HFEYP-447)
  Provide a green tick on completion of cookie action

  [PR-308]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/308)
  [HFEYP-469](https://dfedigital.atlassian.net/browse/HFEYP-469)
  Admin cannot assign herself a new role

  [PR-310]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/310)
  [HFEYP-470](https://dfedigital.atlassian.net/browse/HFEYP-470)
  Order the list of users alphabetically by their email address

  [PR-309]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/309)
  [HFEYP-471](https://dfedigital.atlassian.net/browse/HFEYP-471)
  Cosmetic fixes for user administration

  [PR-312]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/312)
  [HFEYP-481](https://dfedigital.atlassian.net/browse/HFEYP-481)
  Combine error messages for email

  [PR-316]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/316)
  [HFEYP-474](https://dfedigital.atlassian.net/browse/HFEYP-474)
  [HFEYP-475](https://dfedigital.atlassian.net/browse/HFEYP-475)
  [HFEYP-441](https://dfedigital.atlassian.net/browse/HFEYP-441)
  Made preset password token unique, cosmetic updates to password fields, added notification on user admin page
  
  [PR-320]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/320)
  [HFEYP-485](https://dfedigital.atlassian.net/browse/HFEYP-485)
  Clear unique session id on user before deleting to prevent current session from continuing

### Fixed
  [HFEYP-469]( https://dfedigital.atlassian.net/browse/HFEYP-469 )

  Admin cannot change own role

  [PR-294]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/294 )
  [HFEYP-383]( https://dfedigital.atlassian.net/browse/HFEYP-383 )
  Made some changes to divs and navs so that the screen readers reads better

  [PR-295]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/295)
  [HFEYP-396]( https://dfedigital.atlassian.net/browse/HFEYP-396 )
  Adjust html text to change menu button dimensions

  [PR-299]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/299)
  [HFEYP-434]( https://dfedigital.atlassian.net/browse/HFEYP-434 )
  Updates from hotjar fixes, addin the changes made to the previous release to main

  [PR-322]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/322)
  [HFEYP-418]( https://dfedigital.atlassian.net/browse/HFEYP-418 )
  [HFEYP-490]( https://dfedigital.atlassian.net/browse/HFEYP-490 )
  [HFEYP-491]( https://dfedigital.atlassian.net/browse/HFEYP-491 )
  Add a check on the client side for file size before uploading content asset. Check is done on the client side (browser) and the submit button is only enabled if the file size is less than 2MB

  Small fix for missed password error message
  
  [PR-323]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/323)
  [HFEYP-494]( https://dfedigital.atlassian.net/browse/HFEYP-494 )
  Fix typo on aria-labelledby

  [PR-324]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/324)
  [HFEYP-476]( https://dfedigital.atlassian.net/browse/HFEYP-476 )
  Show asterisks in password field if user is being edited
### Changed
  [PR-321]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/321)
  [HFEYP-382]( https://dfedigital.atlassian.net/browse/HFEYP-382 )
  Update content on error page to conform to GDS

## [Release 3]

### Added
  [PR-267]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/267 )

  [HFEYP-239]( https://dfedigital.atlassian.net/browse/HFEYP-239 )

  Add devise-security gem to enable :session_limitable

  [PR-269]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/269 )

  [HFEYP-394]( https://dfedigital.atlassian.net/browse/HFEYP-394 )
  [HFEYP-410]( https://dfedigital.atlassian.net/browse/HFEYP-410 )

  Update page titles (394) and add contact page (410), cookie-policy page now uses standard layout
 
  [HFEYP-435]( https://dfedigital.atlassian.net/browse/HFEYP-435) Updates style of cookie-banner to keep the default black on yellow colour of selected links

  [HYEYP-425](https://dfedigital.atlassian.net/browse/HFEYP-425) - allow JS to reach hotjar.com

  [HYEYP-444](https://dfedigital.atlassian.net/browse/HFEYP-444) - two specs to run Axe accessibility tests and some fixes for the issues found
### Changed
  [PR-289]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/289 )

  [HFEYP-427]( https://dfedigital.atlassian.net/browse/HFEYP-427 )
  [HFEYP-434]( https://dfedigital.atlassian.net/browse/HFEYP-434 )

  Change `contact` to `contact-us`
  Add hotjar cookies to cookie policy

  [PR-262]( https://github.com/DFE-Digital/early-years-foundation-reform/pull/262 )

  [HFEYP-405]( https://dfedigital.atlassian.net/browse/HFEYP-405 )

  Explain the clamav-rest server set up in CLAMAV.md
    * manifest.yml file used to create private servers in eyfs-prod
    * default clamav service url points to new server in eyfs-prod

### Deprecated
### Removed
### Security

## [S8 Return of the Content]

### Added
[#200] Error page, remove full stops from heading
[#201] Add new accessibility page using haml
[#251] Add missing meta tags to the landing page
[#253] Add missing elements from landing page
[#257] Add service down page

### Changed
[#206] Reorder menu and phase banner
[#208] Updated end-to-end feature tests (cucumber)
[#217] Cucumber update
[#225] Use explicit gem versions
[#227] Sidebar navigation (hfeyp-216)
[#237] Unique page titles
[#238] Styling the mobile menu
[#243] Mobile menu now shows sub menus as open
[#246] Update content and styling
[#258] Update accessibility statement

### Deprecated

### Removed

[#219] Removal of tab and tidy-up menu button
[#241] Stop seeding database automatically - docker related seed

### Fixed

[#205] Fix javascript disabled removing mobile submenu
[#207] Fix menu button arrow
[#214] Fix collapsed/expanded menus used by screenreader
[#221] Fixed spacing issue (hfeyp-362)
[#224] Remove no follow and also stop setting AUTH_ON_EVERYTHING on production
[#247] Fix for mobile menu `ul`

### Security

[#226] Create clamav-rest server to check assets for virus
[#242] Updates for clamav-rest antivirus server
