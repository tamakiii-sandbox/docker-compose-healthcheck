SHELL = bash

@start:
	docker-compose up -d

@stop:
	docker-compose stop

@down:
	docker-compose down

@test:
	docker-compose up -d
	bin/healthcheck.sh node
	make -C test

@validate:
	docker-compose run --rm circleci config validate

