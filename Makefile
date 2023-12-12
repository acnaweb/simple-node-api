export PORT=8080
export IMAGE=simple-node-api
export DOCKER_USER=acnaweb
export TAG=latest

c_build:
	docker build -t ${IMAGE} .

c_run:
	docker run -e PORT=${PORT} -p ${PORT}:${PORT} ${IMAGE}

tag:
	docker tag ${IMAGE} ${DOCKER_USER}/${IMAGE}:${TAG}

push: tag
	docker push ${DOCKER_USER}/${IMAGE}:${TAG}

run:
	cd app; \
	npm start; \