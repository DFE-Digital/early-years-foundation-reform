# CI/CD strategy: GitHub Actions + Azure

* Status: accepted

## Context and Problem Statement
How can we get fast feedback on deployments, and ensure environment parity?

How can we minimise toil in deployments of PRs?

## Considered Options

* Azure DevOps pipelines
* Jenkins
* GitHub Actions

## Decision Outcome

Use GitHub Actions for CI (build/test/security) and CD (dev/stage/prod).