# Reject enabling Microsoft Defender for Key Vault and App Service

* Status: won't fix

## Context and Problem Statement

The 2026 ITHC report (Issues 5.1.1 & 5.1.2) flagged that Microsoft Defender for Cloud plans are not enabled for Key Vault or App Service, reducing anomaly detection on secret access and runtime threat detection for the application. Both findings are rated medium risk.

Enabling these plans was investigated as a Terraform change (`azurerm_security_center_subscription_pricing`). Unlike Foundational CSPM, these are paid Cloud Workload Protection plans, not included at no cost.

## Decision Drivers

* Avoid introducing ongoing cost disproportionate to a medium-risk finding
* Cost applies per environment and is not a one-off spend
* No compensating control is lost by not enabling these plans; existing diagnostic logging (App Gateway, Web App, ASP autoscaling) remains in place

## Considered Options

* Enable Defender for Key Vault and Defender for App Service via Terraform across Test and Production
* Enable in Production only
* Do not enable either plan; accept the residual risk

## Decision Outcome

Do not enable Microsoft Defender for Key Vault or Microsoft Defender for App Service.

Verified using the [Azure Pricing Calculator](https://azure.microsoft.com/en-gb/pricing/calculator/?service=defender-for-cloud) against our actual footprint (1 web app + 1 deployment slot + 1 Key Vault): approximately **$29.45/month per environment** (~$353/year), or approximately **$58.90/month** (~$707/year) if enabled across both Test and Production. This is an ongoing operating cost, not a one-off, for two medium-risk findings with no functional or compliance requirement forcing remediation.

The Terraform implementation prepared on branch `HEYP-206/microsoft-defender` will not be merged.

Reconsider this decision if the findings are re-rated to high/critical, if DfE mandates these plans as part of a wider security baseline, or if the cost is absorbed under an existing DfE Azure agreement at no incremental charge to this project.

## Consequences

* The ITHC findings 5.1.1 & 5.1.2 remain an accepted medium residual risk.
* No additional monthly Azure spend is introduced.
* Key Vault and App Service continue to rely on existing diagnostic logging and access policies rather than Defender-specific anomaly/threat detection.
