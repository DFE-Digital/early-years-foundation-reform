# ------------------------------------------------------------------------------
# Base - AMD64 & ARM64 compatible
# ------------------------------------------------------------------------------
FROM ruby:3.3.4-alpine AS base

RUN apk add --no-cache --no-progress --no-check-certificate build-base less curl tzdata gcompat

ENV TZ Europe/London

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------
FROM base as deps

LABEL org.opencontainers.image.description "Application Dependencies"

RUN apk add --no-cache --no-progress --no-check-certificate postgresql-dev yarn

ENV APP_HOME /build

WORKDIR ${APP_HOME}

COPY package.json ${APP_HOME}/package.json
COPY yarn.lock ${APP_HOME}/yarn.lock
COPY .yarn ${APP_HOME}/.yarn
COPY .yarnrc.yml ${APP_HOME}/.yarnrc.yml

RUN yarn install

COPY Gemfile* ./

RUN bundle config set no-cache true
RUN bundle config set without development test
RUN bundle install --no-binstubs --retry=10 --jobs=4

# ------------------------------------------------------------------------------
# Production Stage 
# ------------------------------------------------------------------------------
FROM base AS app

LABEL org.opencontainers.image.source=https://github.com/DFE-Digital/early-years-foundation-reform
LABEL org.opencontainers.image.description "Help for Early Years Providers Rails Application"

RUN echo "Welcome to the EYFS HfEYP Application" > /etc/motd
RUN apk add --no-cache --no-progress --no-check-certificate postgresql-dev yarn openssh chromium
RUN echo "root:Docker!" | chpasswd && cd /etc/ssh/ && ssh-keygen -A

ENV APP_HOME /srv
ENV RAILS_ENV ${RAILS_ENV:-production}
ENV ENVIRONMENT ${ENVIRONMENT:-production}
ENV AUTHORIZED_HOSTS 127.0.0.1
ENV IGNORE_SECRETS_FOR_BUILD=1

RUN mkdir -p ${APP_HOME}/tmp/pids ${APP_HOME}/log

WORKDIR ${APP_HOME}

COPY Gemfile* ./
COPY --from=deps /usr/local/bundle /usr/local/bundle

COPY config.ru ${APP_HOME}/config.ru
COPY Rakefile ${APP_HOME}/Rakefile
COPY public ${APP_HOME}/public
COPY bin ${APP_HOME}/bin
COPY lib ${APP_HOME}/lib
COPY config ${APP_HOME}/config
COPY db ${APP_HOME}/db
COPY app ${APP_HOME}/app

COPY package.json ${APP_HOME}/package.json
COPY yarn.lock ${APP_HOME}/yarn.lock
COPY .yarnrc.yml ${APP_HOME}/.yarnrc.yml
COPY --from=deps /build/.yarn ${APP_HOME}/.yarn
COPY --from=deps /build/node_modules ${APP_HOME}/node_modules

RUN SECRET_KEY_BASE=x bundle exec rails assets:precompile

COPY sshd_config /etc/ssh/
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server"]

# ------------------------------------------------------------------------------
# Development Stage - ./bin/docker-dev
# ------------------------------------------------------------------------------
FROM app as dev

RUN apk add --no-cache --no-progress --no-check-certificate postgresql-client npm graphviz
RUN npm install --global adr-log contentful-cli

RUN bundle config unset without
RUN bundle config set without test
RUN bundle install --no-binstubs --retry=10 --jobs=4

# ------------------------------------------------------------------------------
# Test Stage - ./bin/docker-rspec
# ------------------------------------------------------------------------------
FROM app as test

RUN apk add --no-cache --no-progress --no-check-certificate postgresql-client

RUN bundle config unset without
RUN bundle config set without development
RUN bundle install --no-binstubs --retry=10 --jobs=4

COPY spec ${APP_HOME}/spec
COPY .rspec ${APP_HOME}/.rspec
COPY .rubocop.yml ${APP_HOME}/.rubocop.yml
COPY .rubocop_todo.yml ${APP_HOME}/.rubocop_todo.yml

CMD ["bundle", "exec", "rspec"]
