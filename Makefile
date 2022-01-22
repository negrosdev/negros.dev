.PHONY: dev
dev:
	FLASK_ENV=development flask run


.PHONY: test
test:
	FLASK_ENV=testing ward test


.PHONY: check
check:
	@autoflake app -r -c --remove-all-unused-imports --remove-unused-variables
	@black . --check --exclude="migrations"


.PHONY: format
format:
	@autoflake app -r -i --remove-all-unused-imports --remove-unused-variables
	@black . --exclude="migrations"

.PHONY: migrate
migrate:
	FLASK_ENV=testing flask db upgrade