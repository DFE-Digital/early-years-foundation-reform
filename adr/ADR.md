# Architectural Decision Record Log

This log lists the architectural decisions for EYFS Recovery

<!-- adrlog -->

* [ADR-0000](0000-template.md) - Template
* [ADR-0001](0001-record-architecture-decisions.md) - Record architecture decisions
* [ADR-0002](0002-madr.md) -- Use MADR framework for ADRs
* [ADR-0003](0003-web-framework.md) - Primary development language and framework
* [ADR-0004](0004-database.md) - Use PostgreSQL for primary data store
* [ADR-0003](0005-development-environments.md) - Development Environments
* [ADR-0006](0006-video-hosting-platform.md) - Use YouTube as Video Hosting solution
* [ADR-0007](0007-content-storage-strategy.md) - Use YAML + Markdown for Content
* [ADR-0008](0008-infrastructure-as-code.md) - Use Terraform for infrastructure as code
* [ADR-0009](0009-ci-cd-strategy.md) - CI/CD strategy: GitHub Actions + Review App Deployments on Azure
* [ADR-0010](0010-contentful.md) - Use Contentful CMS for content storage
* [ADR-0011](0011-sentry-monitoring.md) - Monitoring with Sentry
* [ADR-0012](0012-asset-pipeline-static-paths.md) - Serve govuk-frontend assets statically and disable runtime asset compilation
* [ADR-0013](0013-classic-azure-cache-for-redis-bridge.md) - Use classic Azure Cache for Redis as a bridge
* [ADR-0014](0014-accept-key-vault-public-network-access-risk.md) - Accept Key Vault public network access risk for now
* [ADR-0015](0015-reject-self-hosted-runner-for-key-vault-private-endpoint.md) - Reject self-hosted GitHub Actions runner for Key Vault private endpoint access
* [ADR-0016](0016-reject-microsoft-defender-for-key-vault-and-app-service.md) - Reject enabling Microsoft Defender for Key Vault and App Service

<!-- adrlogstop -->

For new ADRs, please use [0000-template.md](0000-template.md) as basis.

Run `./bin/docker-adr` after adding or updating records to update this TOC using [adr-log](https://adr.github.io/adr-log/)

More information on MADR is available at <https://adr.github.io/madr/>.

General information about architectural decision records is available at <https://adr.github.io/>.
