#!/bin/bash

set -e

HOST="$@"
CONTAINER=$(docker-compose ps -q $HOST)

if [ "$CONTAINER" = "" ]; then
  echo "Container should be up."
  exit 2;
fi

COUNT=0
RETRIES=10
INTERVAL=1

while [ $COUNT -lt $RETRIES ]; do
  STATUS=$(docker inspect --format='{{.State.Health.Status}}' $CONTAINER)

  if [ "$STATUS" = "healthy" ]; then
    exit 0
  fi

  let COUNT=COUNT+1 && sleep $INTERVAL
done

exit 1
