define DESCRIPTION
Code quality (testing, linting/auto-formatting, etc.) and local execution
orchestration for $(PROJECT_NAME).
endef

#################################################################################
# CONFIGURATIONS                                                                #
#################################################################################

NUM_PROCS:=$(shell nproc --all)
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := help
.DELETE_ON_ERROR:
.SUFFIXES:

#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME := $(shell basename $(PROJECT_DIR))

#################################################################################
# HELPER TARGETS                                                                #
#################################################################################

.PHONY: _validate-poetry-installation
_validate-poetry-installation:
ifeq ($(shell command -v poetry),)
	@echo "poetry could not be found!"
	@echo "Please install poetry!"
	@echo "Ex.: 'curl -sSL \
	https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py  | python - \
	&& source $$HOME/.local/env'"
	@echo "see:"
	@echo "- https://python-poetry.org/docs/#installation"
	@echo "Note: 'pyenv' recommended for Python version management"
	@echo "see:"
	@echo "- https://github.com/pyenv/pyenv"
	@echo "- https://python-poetry.org/docs/managing-environments/"
	false
else
	@echo "Using $(shell poetry --version) in $(shell which poetry)"
endif

.PHONY: update-dependencies
## Update and install Python dependencies (alongside source code),
## updating packages in `poetry.lock` with any newer versions
## that adhere to `pyproject.toml` version range constraints
update-dependencies:
	poetry update --lock -vv
	$(MAKE) provision-environment

#################################################################################
# COMMANDS                                                                      #
#################################################################################

.PHONY: provision-environment
## Set up a Python virtual environment with installed project dependencies
provision-environment: _validate-poetry-installation
	poetry install --no-interaction -vv

#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := help

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
# sed script explained:
# /^##/:
# 	* save line in hold space
# 	* purge line
# 	* Loop:
# 		* append newline + line to hold space
# 		* go to next line
# 		* if line starts with doc comment, strip comment character off and loop
# 	* remove target prerequisites
# 	* append hold space (+ newline) to line
# 	* replace newline plus comments by `---`
# 	* print line
# Separate expressions are necessary because labels cannot be delimited by
# semicolon; see <http://stackoverflow.com/a/11799865/1968>
export DESCRIPTION
.PHONY: help
help:
ifdef DESCRIPTION
	@echo "$$(tput bold)Description:$$(tput sgr0)" && echo "$$DESCRIPTION" && echo
endif
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}' \
	| more $(shell test $(shell uname) = Darwin && echo '--no-init --raw-control-chars')

