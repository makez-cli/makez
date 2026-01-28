# Example plugin for makez
PLUGIN_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: example-hello example-date

example-hello: ## Say hello from plugin
	@echo "Hello from example plugin!"

example-date: ## Show current date and time
	@echo "Current date: $(shell date)"
