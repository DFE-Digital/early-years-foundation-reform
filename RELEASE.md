# Delivery workflow

We use 10 swim lanes on the [Jira][jira] board.

**1. Sprint Backlog/Ready for development**

- meets [definition of ready](#definition-of-ready)

**2. Development**

- active local development
- push to remote; the branch name must start with a ticket number, for example `ER-xxx`
- mark PR as `draft` and summarise deliverable
- associate to release candidate milestone

**3. Blocked**

- stalled or parked
- label PR as `blocked`

**4. Developer Peer Review**

- `content` deployment
- `ER-456` branch
- <https://eyrecovery-review-pr-123.azurewebsites.net>
- [feature deployments][deployments]
- meets [definition of done](#definition-of-done)
- mark PR as `ready` and [request review](#review-process)
- once approved move ticket to `#5`

**5. Ready for QA**

**6. In Test QA (Quality Assurance)**

- `content` deployment
- seek business analyst sign-off
- confirm the acceptance criteria
- label PR as `pass` or `fail`
- once passed merge to `main` branch and move ticket to `#6`

**7. Integration testing**

- `development` deployment
- `main` branch
- <https://eyrecovery-dev.azurewebsites.net>
- update accessibility and quality checks as required

**8. Approval PO (Product owner)**

- `staging` deployment
- `rcx.x.x` release candidate tag
- <https://staging.child-development-training.education.gov.uk>
- [open milestones (release candidates)][release-candidates]
- seek product owner sign-off

**9. Release**

- `production` deployment
- `vx.x.x` version tag
- <https://child-development-training.education.gov.uk>
- [close milestone][released-versions] and rename from `rc` to `v`
- periodically publish a [release][releases] CHANGELOG

**9. Done - Live**

- post release tasks


## Definition of Ready

- description is clear and unambiguous
- acceptance criteria are present and understood
- ticket is estimated to be deliverable within a single sprint

## Definition of Done

- meets acceptance criteria
- includes appropriate documentation
- includes unit and feature tests
- maintains minimum coverage
- review app deployed
- deployment tested by the author

## GitHub labels

Github PRs use descriptive [labels][labels], most of which are applied automatically.


1. **adr**, Architectural Design Record.
1. **content**, Course and page content changes.
1. **dependencies**, Pull requests that update a dependency file.
1. **documentation**, Improvements or additions to documentation.
1. **frontend**, Changes to assets detected.
1. **pipeline**, Github workflow changes.
1. **ruby**, Pull requests that update Ruby code.
1. **terraform**, Changes to Terraform detected..

Manual labels:

1. **blocked**, Currently blocked.
1. **review**, Review app deployed for testing.
1. **bug**, Squashes a bug.
1. **pass**, Acceptance criteria met.
1. **fail**, Acceptance criteria NOT met.



## Application state

- `Rails.application.live?` returns `true` if deployed as a final release to our public facing workspace.
- `Rails.application.debug?` returns `true` if running locally in development mode or as a feature peer review application.

These two predicates can toggle "production", or "development" only features such as revealing debugging information.


## Dependencies

Application libraries and workflow actions are monitored by [Dependabot][dependabot].


---

[jira]: https://dfedigital.atlassian.net/jira/software/projects/ER
[deployments]: https://dfedigital.atlassian.net/jira/software/projects/ER/deployments

[release-candidates]: https://github.com/DFE-Digital/early-years-foundation-reform/milestones?state=open
[released-versions]: https://github.com/DFE-Digital/early-years-foundation-reform/milestones?state=closed
[tags]: https://github.com/DFE-Digital/early-years-foundation-reform/tags
[releases]: https://github.com/DFE-Digital/early-years-foundation-reform/releases
[labels]: https://github.com/DFE-Digital/early-years-foundation-reform/labels
[dependabot]: https://github.com/DFE-Digital/early-years-foundation-reform/security/dependabot