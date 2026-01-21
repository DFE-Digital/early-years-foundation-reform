# Use Contentful CMS for content storage

* Status: accepted, supersedes [ADR-0007](0007-content-storage-strategy.md)

## Context and Problem Statement
YAML editing workflow proving sub-optimal.

## Decision Drivers

* Editors need non-developer content workflow.
* YAML limits velocity and governance.
* Need authoritative content store with API

## Considered Options

* Static YAML
* Git-based CMS
* Contentful
* Sanity
* Strapi

## Decision Outcome

Contentful is the mandated CMS for DfE projects. It supports editorial roles and permissions, has operations for content publishing.

Introduces a run-time dependency on the Contentful API.