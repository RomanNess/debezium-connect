VERSION=1.5.3.Final
FLAVOR=debezium-connector-postgres
IMAGE=ghcr.io/romanness/scb-debezium-connect:test

all: download build push

download:
	curl https://repo1.maven.org/maven2/io/debezium/${FLAVOR}/${VERSION}/${FLAVOR}-${VERSION}-plugin.tar.gz | tar xvz

build:
	docker build -f Dockerfile -t ${IMAGE} .

login:
	@echo ${GH_PAT} | docker login ghcr.io --username ${GH_USER} --password-stdin

push: login
	docker -l debug push ${IMAGE}