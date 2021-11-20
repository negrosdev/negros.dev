.PHONY: dev
dev:
	FLASK_ENV=development flask run


.PHONY: test
test:
	FLASK_ENV=testing ward test


.PHONY: check
check:
	@black . --check --exclude="migrations"


.PHONY: format
format:
	@black . --exclude="migrations"

.PHONY: migrate
migrate:
	FLASK_ENV=testing flask db upgrade