SHORT_NAME ?= discounts-api

include versioning.mk

test:
	docker run --rm -it ${REGISTRY}/${IMAGE_PREFIX}/${SHORT_NAME}:${VERSION} sbt clean test

docker-build:
	docker build -t ${REGISTRY}/${IMAGE_PREFIX}/${SHORT_NAME}:${VERSION} .

docker-push:
	docker push ${REGISTRY}/${IMAGE_PREFIX}/${SHORT_NAME}:${VERSION}

.PHONY: test docker-build docker-push
