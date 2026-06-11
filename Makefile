.PHONY: adr-index help

## Regenerate adr/INDEX.yaml from adr/LOG.yaml
adr-index:
	python3 scripts/adr-index.py

help:
	@echo "Targets:"
	@echo "  adr-index   Regenerate adr/INDEX.yaml from adr/LOG.yaml"
