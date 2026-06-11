# AGENTS.md — landvault-governance

This file is the Claude Code agent instruction file for the
`landvault-governance` repository.

## Repository purpose

The `landvault-governance` repo is the LandVault Platform governance corpus:
cross-cutting ADRs, the RFC ratification process, and the LandVault Platform
Steward role. Instruments in this repo acquire authority through RFC
ratification, not by assertion.

## Entry point

Deployed at: `https://miraterra.github.io/landvault-governance/`
Source: `index.html` at repo root, served by GitHub Pages from `main`.

## Key directories

```
adr/          ADR documents, LOG.yaml, and INDEX.yaml
scripts/      Tooling scripts (adr-index.py, etc.)
```

## ADR lifecycle statuses

ADRs in this corpus use a governance-specific lifecycle, distinct from the
cage's `accepted` status:

- `proposed`    — ADR is open for the objection window
- `ratified`    — binding in its scope; imposition prevented by
                  recorded-objection discipline
- `superseded`  — replaced by a later ADR; include `superseded_by` field
- `withdrawn`   — retracted before ratification
- `CARRIED`     — ratified-at-origin, proposed-at-platform (cross-repo
                  scope not yet conferred)

SCOPED-binding fields allow an ADR to carry both an `origin_status` (e.g.,
`ratified`) and a `platform_status` (e.g., `proposed`) when scope has been
ratified at the authoring repo but not yet across all platform repos.

## ADR tooling

Regenerate `adr/INDEX.yaml` from `adr/LOG.yaml`:

```
make adr-index
```

Or directly:

```
python3 scripts/adr-index.py
```

## Cage methodology

This project uses the LandVault cage methodology. Agent roles, skills, and
runbooks live in the cage repo:

```
~/git/landvault/landvault-cage/agents/<role>/agent.md
~/git/landvault/landvault-cage/skills/<skill>.md
~/git/landvault/landvault-cage/runbooks/<runbook>.md
```

Issue prefix: `LVGOV`
Issues: `~/git/landvault/landvault-management/issues/LVGOV-*.yaml`
Backlog: `~/git/landvault/landvault-management/issues/BACKLOG.yaml`
