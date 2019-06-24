SHELL := bash

all: \
	status \
	ping

status:
	##########################################
	# status test
	##########################################
	curl -s -D /dev/stderr http://localhost:8080/status | tee /dev/stderr | jq --exit-status 'select(.status == "ok")'

ping:
	##########################################
	# ping test
	##########################################
	curl -s -D /dev/stderr http://localhost:8080/ping | tee /dev/stderr | jq --exit-status 'select(.message == "pong")'

