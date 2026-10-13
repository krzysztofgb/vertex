SHELL := /bin/bash
SOURCES := $(shell git ls-files --cached --others --exclude-standard '*.cpp' '*.hpp')
COMPOSE := docker compose -f deploy/docker-compose.yml

.PHONY: help test test-all fmt fmt-check tidy up down clean

help:
	@grep -E '^[a-z-]+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##/\t/'

test: ## Build and run tests under ASan+UBSan
	cmake --preset asan
	cmake --build --preset asan
	ctest --preset asan

test-all: ## Run tests on every preset
	@for p in debug asan release; do \
	  cmake --preset $$p && cmake --build --preset $$p && ctest --preset $$p || exit 1; \
	done

fmt: ## Format all sources in place
	tools/clang-format.sh $(SOURCES)

fmt-check: ## Fail if any source is unformatted
	tools/clang-format.sh --check $(SOURCES)

tidy: ## Run clang-tidy over all .cpp files
	tools/clang-tidy.sh $(filter %.cpp,$(SOURCES))

up: ## Start Prometheus + Grafana (http://localhost:3000)
	$(COMPOSE) up -d

down: ## Stop the local stack
	$(COMPOSE) down

clean: ## Remove build outputs
	cmake -E remove_directory build
