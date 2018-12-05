
BRANCH=$(shell git branch | grep \* | cut -d ' ' -f2)
COMMIT_SHA=$(shell git rev-parse head)

clean:
	docker-compose down -v --rmi all

lint:
	echo 'metalinter';

vet:
	echo 'vet';

static-analysis: lint vet

test:
	@docker-compose up --remove-orphans -d || true
	docker exec -it webapp sh -c 'go test ./...'
	@docker-compose down -v --rmi all || true

coverage:
	echo 'coverage';

build:
	docker build -t webapp:${BRANCH}-${COMMIT_SHA} --target deploy .

push:
	docker tag webapp:${BRANCH}-${COMMIT_SHA} webapp:${BRANCH}-${COMMIT_SHA}
	docker push webapp:${BRANCH}-${COMMIT_SHA}
