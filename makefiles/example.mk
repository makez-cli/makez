# Example commands - delete or modify as needed
.PHONY: hello hello-script

hello: ## Say hello (inline)
	@echo "👋 Hello from MakeZ!"

hello-script: ## Say hello (using script)
	@$(MAKEFILE_DIR)scripts/example.sh
