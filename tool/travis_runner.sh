#!/usr/bin/env bash

set -e

./mvnw install -Dinvoker.skip=false $PHASE | egrep -v 'Download|\\[exec\\] [[:digit:]]+/[[:digit:]]+|^[[:space:]]*\\[exec\\][[:space:]]*$'

MVN_STATUS=${PIPESTATUS[0]}

if [ $MVN_STATUS != 0 ]
then
  exit $MVN_STATUS
fi

if [[ -v COMMAND ]]
then
  $COMMAND
fi
