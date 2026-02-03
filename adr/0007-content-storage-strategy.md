# Use YAML + Markdown for Content

* Status: accepted, superseded by [ADR-0010](0010-contentful.md)

## Context and Problem Statement

How might we introduce/store both module content and assessment content in the application so that it may be navigated through and displayed to the user.

## Decision Drivers

* Limited delivery timescales, i.e. 4 sprint private beta development period
* Navigation structures need to be defined
* Straightforward to use by Content Editors
* Limited involvement by Development in the content deployment process 

## Considered Options

* Integrate with a commercial CMS, e.g. Contentful
* Adapt the EYFS Reforms CMS
* Create content as a mix of YAML and Markdown and mechanically translate to GDS compliant HTML
* Create GDS compliant HTML by hand

## Decision Outcome

Chosen option: Create content as a mix of YAML and Markdown and mechanically translate to GDS compliant HTML.

* A CMS would not natively support the creation of either questionnaire or navigation content, therefore this data would need to be stored and processed elsewhere. 
* Any content stored in a CMS would also need to be translated into GDS compliant HTML. 
* The integration of a CMS would be a non-complex task, as would modifying the EYFS Reforms CMS to support these additional requirements in the timescales we currently have.
* Creating GDS compliant HTML directly would require intensive developer support.

Using a text based YAML+Markdown file and building a translation and navigation engine would give the Content Editors a simple structure by which then could create content but, once the engine is developed, minimal developer support would be needed to add extra content.
