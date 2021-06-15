# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
we do not currently follow Semantic Versioning or track version numbers.


## [Unreleased]

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
### Fixed
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
