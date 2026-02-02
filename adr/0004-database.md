# Use PostgreSQL for primary data store

* Status: accepted

## Context and Problem Statement
Which database solution should we use?

## Decision Drivers
* Rails default for production grade applications
* Alignment with DfE / GDS Rails pattern
* Requirement for data integrity (ACID, strong relational modelling)
* Combination with RSpec for behaviour driven testing
* Managed Azure PostgreSQL not an option

## Considered Options
Implicitly considered, not formally evaluated at project inception
Security considerations: database access restricted at network level

## Decision Outcome
Use PostgreSQL as the primary data store
Use PostgreSQL as the primary data store.
Deploy on dedicated VM, and make accessible only from application subnet.