.PHONY: build
build:
	docker-compose build

.PHONY: run
run:
	docker-compose run --service-ports --rm app
