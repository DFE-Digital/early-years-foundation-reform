# Deployment pipeline, and Infrastructure as Code

* Status: accepted

## Context and Problem Statement
How will we deploy infrastructure to the Azure environments?

## Decision Drivers

* Need for reproducible, reviewable Azure resource provisioning across dev/stage/prod
* Standard practice in DfE
* Industry standards
* Security
* Automated deployments with minimal manual intervention, minimise SRE toil

## Considered Options

* ARM templates
* Pulumi
* Hashicorp Terraform
* Bicep

## Decision Outcome

Terraform, used by many DfE projects. Standard plan/apply with GitHub actions; drift detection; policy integration.

The team commits to deploying infrastructure through terraform and automated pipelines, with minimum click-ops in the Azure Portal.