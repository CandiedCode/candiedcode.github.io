MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

.PHONY: install
install:
	brew install hugo

.PHONY: upgrade
upgrade:
	brew upgrade hugo

.PHONY: version
version:
	hugo version

.PHONY: create
create:
	hugo new site blog

.PHONY: hugo-refresh-theme
hugo-refresh-theme:
	rm config.toml \
	&& curl -O https://raw.githubusercontent.com/PippoRJ/hugo-refresh/master/exampleSite/config.yaml
	&& git submodule add https://github.com/PippoRJ/hugo-refresh.git themes/hugo-refresh \
.PHONY: hugo-refresh-theme

.PHONY: hugo-soho-theme
hugo-soho-theme:
	rm config.yaml \
	&& curl -O https://raw.githubusercontent.com/alexandrevicenzi/soho/master/exampleSite/config.toml \
	&& git submodule add https://github.com/alexandrevicenzi/soho.git themes/soho

.PHONY: m10c
m10c:
	git submodule add https://github.com/vaga/hugo-theme-m10c.git themes/m10c

.PHONY: submodule/update
submodule/update:
	git submodule update --remote --merge

.PHONY: serve
serve:
	hugo server -D

.PHONY: build
build:
	cd website && npm run build

.PHONY: update
update:
	cd website && npx browserslist@latest --update-db && npm update
