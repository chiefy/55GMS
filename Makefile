DOCKER_IMAGE?=ghrc.io/chiefy/55gms
DOCKER_TAG?=latest

.PHONY: build-docker
build-docker:
	@docker build --no-cache -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

.PHONY: run
run:
	@docker-compose up -d
	@sleep 4000
	@open localhost:8080

.PHONY: stop
stop:
	@docker-compose stop; docker-compose rm -fv