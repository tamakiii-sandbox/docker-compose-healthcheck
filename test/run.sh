#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

CONTAINER=$1
CMD=$2

COUNT=0
RETRIES=5
INTERVAL=10

while [ $COUNT -lt $RETRIES ]; do
  STATUS=`docker inspect --format='{{.State.Health.Status}}' $CONTAINER`

  echo "[info] status: $STATUS";

  if [ "$STATUS" = "healthy" ]; then
    exec $CMD;
    break;
  fi

  let COUNT=COUNT+1
  sleep $INTERVAL
done

