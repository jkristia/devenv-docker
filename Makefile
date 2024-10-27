help:
	@awk -F ':|##' '/^[^\t].+:.*##/ { printf "\033[36mmake %-28s\033[0m -%s\n", $$1, $$NF }' $(MAKEFILE_LIST) | sort

build-dev-image: ## Build dev environment Docker image
	@docker build -f dev-container/Dockerfile -t devenv-image:latest .

build-run-dev: build-dev-image ## Build and run dev image
	./devenv.sh
