# Key Vault Network Access

## Current state

The Key Vault (`s195p01-hfeyp-kv`) has been hardened with a `network_acls` block:

- `default_action = "Deny"` — all public network access is blocked by default
- `bypass = "AzureServices"` — trusted Azure services (including App Gateway) can still reach the Key Vault via the public endpoint
- `ip_rules` — dynamically populated on each Terraform apply from [GitHub's published runner IP ranges](https://api.github.com/meta), filtered to IPv4 only (Key Vault does not support IPv6 in `ip_rules`)

This addresses the ITHC 2026 finding 5.1.1 "Public Network Access Enabled" by significantly reducing the attack surface. Unauthenticated scanning, probing, and enumeration attempts from the public internet are now blocked. The IP list is self-maintaining — it refreshes automatically on every Terraform apply.

## Why a private endpoint wasn't added

The ITHC report also recommends removing the public endpoint entirely and routing traffic through a private endpoint within the VNet. This is the fuller fix, but it has a hard dependency on the GitHub Actions pipeline.

### How GitHub Actions still works

Certificate creation and renewal is managed by Terraform and runs in GitHub Actions using GitHub-hosted runners. These runners operate on GitHub's infrastructure with public egress IPs. The `ip_rules` in the current `network_acls` configuration are dynamically populated from GitHub's published IP ranges on each Terraform apply, so GitHub Actions runners are explicitly allowed to reach the Key Vault for cert/secret management. This allows the pipeline to continue operating without a self-hosted runner.

The fuller `public_network_access_enabled = false` approach (complete private endpoint-only access) would require a self-hosted runner, which is why that remains deferred.

### What the fuller fix requires

To disable the public endpoint entirely we would need:

1. A self-hosted GitHub Actions runner deployed inside the VNet, so the pipeline can reach the private endpoint
2. An `azurerm_private_endpoint` resource for the Key Vault
3. A private DNS zone (`privatelink.vaultcore.azure.net`) and VNet link so DNS resolves inside the VNet
4. A dedicated subnet for the Key Vault private endpoint (following the pattern already used for Redis)

### Bastion / jump host

We have no Azure Bastion or jump host because we have no database — there has been no need to get into the VNet for operational tasks. However, a self-hosted runner or bastion would benefit other resources beyond just Key Vault:

- It would allow private endpoint adoption for App Service (currently uses VNet integration but still has a public-facing hostname)
- It would be a prerequisite for locking down any future database or storage account to VNet-only access
- It would give operators a secure path into the VNet for incident response without opening firewall rules

## Recommended next steps

1. Raise a separate ticket to evaluate a self-hosted runner (or a GitHub Actions runner scale set in ACI/AKS) deployed into the VNet
2. Once that is in place, complete the private endpoint migration for Key Vault and remove `bypass = ["AzureServices"]`
3. Consider whether other resources (Redis, App Service) should follow the same pattern
