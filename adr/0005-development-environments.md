# Development Environments

* Status: accepted

## Context and Problem Statement

How might we ensure the consistency of our environments across different operating systems?

## Decision Drivers

* Parity of development environment for each developer
* Faster bootstrapping for new developers
* Option to deploy a container
* Convenience of maintaining the latest versions of dependant services
* Docker stages ensure each environment has the correct libraries

## Considered Options

* Manual installation
* Build packs

## Decision Outcome

Chosen option: Containerised environments using Docker and Docker Compose.
