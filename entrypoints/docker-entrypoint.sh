#!/bin/sh

set -e

# Ensure that there won’t be server conflicts when we start the application
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

/usr/sbin/sshd

eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:prepare db:seed:replant

# Start the application
bundle exec rails s -b 0.0.0.0
