IMAGE_PREFIX = reynoldsm88/
IMAGE_NAME = centos-jdk
IMG := $(IMAGE_PREFIX)$(IMAGE_NAME)

info:
	echo "Available targets are 'clean', 'clean-all', & 'docker-build'"

clean:
	docker images | grep $(IMAGE_NAME) | awk '{print $$3}' | grep -v IMAGE | xargs docker rmi -f

clean-all: clean
	docker system prune -f

docker-build:
	docker build -t $(IMG):latest .

docker-push:
	docker push $(IMG):latest .