#!/bin/bash

# Exit on fail
set -e

SERVER_PID="tmp/pids/server.pid"

if [ -f  "$SERVER_PID" ]; then
  rm -f "$SERVER_PID"
fi

# Finally call command issued to the docker service
exec "$@"