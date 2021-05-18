#!/bin/sh

set -e

# Ensure that there won’t be server conflicts when we start the application
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Start the application
bundle exec rails s -b 0.0.0.0
