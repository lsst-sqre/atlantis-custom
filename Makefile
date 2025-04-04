.PHONY: help
help:
	@echo "Make targets for atlantis-custom repo management"
	@echo "make init - Set up repo management tooling environment"
	@echo "make update - Update pinned dependencies and run make init"
	@echo "make update-deps - Update pinned dependencies"

.PHONY: init
init:
	uv sync --frozen --all-groups
	uv run pre-commit install

.PHONY: update
update: update-deps init

.PHONY: update-deps
update-deps:
	uv lock --upgrade
	uv run --only-group=repo pre-commit autoupdate
