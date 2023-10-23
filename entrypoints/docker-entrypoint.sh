#!/bin/sh

set -e

# Ensure that there won’t be server conflicts when we start the application
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

/usr/sbin/sshd

bundle exec rake db:prepare db:seed:replant

# Start the application
bundle exec rails s -b 0.0.0.0
