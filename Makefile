IMAGE_PREFIX = reynoldsm88
IMAGE_NAME = centos-jdk
IMG := $(IMAGE_PREFIX)/$(IMAGE_NAME)

docker-build:
	docker build --pull -t $(IMG):latest .

docker-push:
	docker push $(IMG):latest