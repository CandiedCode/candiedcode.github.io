MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c 

.PHONY: serve
serve:
	cd website && npm run start

.PHONY: build
build:
	cd website && npm run build

.PHONY: install
install:
	cd website  && npm install

.PHONY: version
version:
	cd website && npm docusaurus --version

.PHONY: update
update:
	cd website && npx browserslist@latest --update-db && npm update