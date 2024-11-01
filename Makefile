help:
	@awk -F ':|##' '/^[^\t].+:.*##/ { printf "\033[36mmake %-28s\033[0m -%s\n", $$1, $$NF }' $(MAKEFILE_LIST) | sort

PHONY: build-dev-image
build-dev-image: ## Build dev environment Docker image
	@docker build -f container/Dockerfile -t devenv-image:latest .

PHONY: build-run-dev
build-run-dev: build-dev-image ## Build and run dev image
	./devenv.sh

PHONY: api
api: ## build proto api
	protoc \
		--proto_path=./proto \
		--python_out=. \
		test.proto
	mkdir -p ./proto/json_out
	protoc \
		--proto_path=./proto \
		--jsonschema_out=./proto/json_out \
		test.proto
