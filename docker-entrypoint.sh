#!/bin/sh
# ------------------------------------------------------------------------------
set -e

if [ -z ${PROXY_CERT} ]
then
  echo "No proxy certificate to append"
else
  echo "Appending proxy certificate"
  cat $PROXY_CERT >> /etc/ssl/certs/ca-certificates.crt
fi

if [ ${RAILS_ENV} != "production" ]
then

#
# Development & Test
#
# ------------------------------------------------------------------------------
  if bundle check
  then
    echo "$RAILS_ENV gems already bundled"
  else
    bundle
  fi

  if [ ! -d "node_modules" ]
  then
    bundle exec rails yarn:install
  fi

  if [ -z ${DATABASE_URL} ]
  then
    echo "DATABASE_URL is not defined and cannot be prepared"
  else
    bundle exec rails db:create db:migrate
  fi

  rm -f tmp/pids/server.pid

# ------------------------------------------------------------------------------
else

#
# Production
#
# ------------------------------------------------------------------------------
  if [ -z ${ENVIRONMENT} ]
  then
    echo "Azure ENVIRONMENT is not defined"
  else
    # Azure WebSSH
    /usr/sbin/sshd
    eval $(printenv | xargs 2>/dev/null | export > /root/.profile)

    bundle exec rails db:create db:migrate

    case ${ENVIRONMENT} in
      "development" )
        bundle exec rails db:seed
        ;;
      "staging" )
        # no op
        ;;
      "production" )
        rm public/robots.txt && touch public/robots.txt
        ;;
      * )
        echo "Azure ENVIRONMENT ${ENVIRONMENT} is not supported"
    esac
  fi

# ------------------------------------------------------------------------------
fi

exec bundle exec "$@"
