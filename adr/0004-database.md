# Use PostgreSQL for primary data store

* Status: accepted

## Context and Problem Statement
Which database solution should we use?

## Decision Drivers
* Rails default for production grade applications
* Alignment with DfE / GDS Rails pattern
* Requirement for data integrity (ACID, strong relational modelling)
* Combination with RSpec for behaviour driven testing

## Considered Options
Implicitly considered, not formally evaluated at project inception

## Decision Outcome
Use PostgreSQL as the primary data store
