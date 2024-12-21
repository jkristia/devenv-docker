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
		--python_out=./proto_out \
		test.proto \
		chakra_et_def.proto \

	mkdir -p ./proto/json_out
	protoc \
		--proto_path=./proto \
		--jsonschema_opt=enforce_oneof \
		--jsonschema_opt=enums_as_strings_only \
		--jsonschema_opt=prefix_schema_files_with_package \
		--jsonschema_opt=json_fieldnames \
		--jsonschema_opt=disallow_additional_properties \
		--jsonschema_opt=prefix_schema_files_with_package \
		--jsonschema_out=./proto/json_out \
		test.proto \
		chakra_et_def.proto
