default: help

include includes/*.mk

.PHONY: setup # Alias for docker/up
setup: docker/up app/logs

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo ""
	@cat $(MAKEFILE_LIST) | grep "^\.PHONY" | sed 's/\.PHONY: //' | sed 's/#/\t/g' | column -t -s $$'\t' | sort -b
