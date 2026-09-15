# Accept Key Vault public network access risk for now

* Status: won't fix

## Context and Problem Statement

The Key Vault used by the staging and production environments currently allows public network access. An infrastructure change was considered to set `default_action = "Deny"` and allow GitHub-hosted Actions runners using the IP ranges published by GitHub.

The approach could not be applied because GitHub's published Actions IPv4 ranges contained 5,436 entries, while Azure Key Vault permits a maximum of 1,000 `network_acls.ip_rules` entries. The change was reverted after the Terraform apply failed.

## Decision Drivers

* Reduce the attack surface identified by the ITHC finding
* Avoid an unreliable Key Vault firewall configuration
* Preserve reliable Terraform plan and apply operations
* Keep the option of a private endpoint migration available

## Considered Options

* Keep the current public Key Vault network access configuration
* Maintain the full GitHub-hosted runner IP allowlist
* Use a curated static IP allowlist
* Migrate Key Vault to a private endpoint (see [ADR-0015](0015-reject-self-hosted-runner-for-key-vault-private-endpoint.md))

## Decision Outcome

Accept the medium residual risk and retain the current Key Vault public network access configuration for now.

The full GitHub Actions IP allowlist is not an option because it exceeds Azure Key Vault's rule limit. A curated allowlist is not sufficiently reliable for GitHub-hosted runners because their public egress IP is not stable or dedicated to this project.

Reconsider this decision when a shared DfE self-hosted runner platform becomes available, the risk rating or remediation deadline changes, or the service's security requirements require private-only Key Vault access.

## Consequences

* The ITHC finding remains an accepted medium residual risk.
* Key Vault continues to be reachable through its public endpoint.
* Terraform deployment remains dependent on GitHub-hosted runners and does not require runner lifecycle management.
* A future private-only migration is tracked separately in [ADR-0015](0015-reject-self-hosted-runner-for-key-vault-private-endpoint.md).

