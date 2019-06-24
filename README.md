# docker-compose-healthcheck

## How to use

~~~sh
docker-compose up
test/run.sh $(docker-compose ps -q node) 'make -C test'
~~~
