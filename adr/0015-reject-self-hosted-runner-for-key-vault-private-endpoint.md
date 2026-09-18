# Reject self-hosted GitHub Actions runner for Key Vault private endpoint access

* Status: won't fix

## Context and Problem Statement

A more complete fix for the Key Vault public network access finding (see [ADR-0014](0014-accept-key-vault-public-network-access-risk.md)) would migrate Key Vault to a private endpoint with `default_action = "Deny"`. This requires Terraform to reach Key Vault from inside the Azure VNet, which GitHub-hosted Actions runners cannot do.

The only way to make this work is a self-hosted GitHub Actions runner deployed inside the Azure VNet, alongside a Key Vault private endpoint and private DNS zone. This introduces an always-on Azure VM, networking costs, OS patching, runner software maintenance, monitoring, and ongoing operational ownership that the team does not currently have capacity for.

## Decision Drivers

* Avoid introducing infrastructure and operational cost disproportionate to a medium-risk ITHC finding
* Avoid taking on runner lifecycle management (patching, monitoring, credential rotation) without dedicated capacity
* Prefer a solution that doesn't require an always-on VM for an otherwise ephemeral CI workload

## Considered Options

* Deploy a self-hosted GitHub Actions runner in the Azure VNet with a basic network design (VM + private endpoint + private DNS)
* Deploy the same design with a NAT Gateway for more restricted/controlled outbound networking
* Do not deploy a self-hosted runner; accept the residual risk documented in [ADR-0014](0014-accept-key-vault-public-network-access-risk.md)

## Decision Outcome

Do not deploy a dedicated Azure-hosted GitHub Actions runner solely to enable a Key Vault private endpoint.

Estimated infrastructure cost, confirmed using the [Azure Pricing Calculator](https://azure.microsoft.com/en-gb/pricing/calculator/), is approximately $75/month for a basic design (VM + private endpoint + private DNS), or approximately $110/month with a NAT Gateway added for more restricted outbound networking. GitHub does not charge for self-hosted runners, but the hosting infrastructure and its operation remain the project's responsibility.

This cost and ongoing operational burden is disproportionate to the medium-risk finding it would remediate, so the residual risk is accepted instead (see [ADR-0014](0014-accept-key-vault-public-network-access-risk.md)).

Reconsider this decision if a shared DfE self-hosted runner platform becomes available (removing the dedicated-VM cost), or if the finding's risk rating increases such that private-only access becomes mandatory.

## Consequences

* No self-hosted runner, private endpoint, NAT Gateway, or private DNS costs are introduced.
* Terraform deployment continues to rely on GitHub-hosted runners and does not require runner lifecycle management.
* A future migration to a private-only Key Vault will still require a self-hosted runner, a shared DfE runner platform, or another network path into the VNet.
