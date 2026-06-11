# landvault-governance

The LandVault Platform governance corpus.

Cross-cutting ADRs, the RFC ratification process, and the LandVault Platform
Steward role. Instruments in this repo acquire authority through RFC
ratification, not by assertion.

## Entry point

**`https://miraterra.github.io/landvault-governance/`**

Deployed via GitHub Pages from the `main` branch root.

## Repository layout

```
index.html        GitHub Pages entry point
adr/
  LOG.yaml        Authoritative ADR log (full entries)
  INDEX.yaml      Compact scan-file (generated — do not edit by hand)
scripts/
  adr-index.py    Regenerates INDEX.yaml from LOG.yaml
Makefile          Build targets
```

## ADR tooling

After editing `adr/LOG.yaml`, regenerate the index:

```
make adr-index
```

### ADR lifecycle

| Status | Meaning |
|---|---|
| `proposed` | Open for the objection window |
| `ratified` | Binding in its scope |
| `superseded` | Replaced by a later ADR (see `superseded_by`) |
| `withdrawn` | Retracted before ratification |
| `CARRIED` | Ratified-at-origin, proposed-at-platform |

An ADR may carry both `origin_status` and `platform_status` when scope has
been ratified at the authoring repo but not yet extended across all platform
repos (SCOPED-binding model).

## Methodology

This repo uses the LandVault cage methodology. See `AGENTS.md` for agent
conventions and `CLAUDE.md` for Claude Code configuration.
