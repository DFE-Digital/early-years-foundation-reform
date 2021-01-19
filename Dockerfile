# Build compilation image
FROM ruby:2.7.2-alpine as build

# The application runs from /app
WORKDIR /app

# Add the timezone as it's not configured by default in Alpine
RUN apk add --update --no-cache tzdata && \
  cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
  echo "Europe/London" > /etc/timezone

# build-base: complication tools for bundle
# git: version manager
# nodejs: JavaScript runtime built on Chrome's V8 JavaScript engine
# yarn: node package manager
# postgresql-dev: postgres driver and libraries
RUN apk add --no-cache --update build-base git nodejs yarn postgresql-dev

# Setting LANG and RAILS_ENV variables
ARG RAILS_ENV=production
ENV LANG=C.UTF-8 \
    RAILS_ENV=${RAILS_ENV}

# Install bundler and gems defined in Gemfile
COPY .ruby-version Gemfile Gemfile.lock /app/
RUN gem update --system \
    && gem install bundler:2.1.4 --no-document \
    && bundle install --jobs=4 --no-binstubs \
    && gem cleanup

# Install node packages defined in package.json, including webpack
COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile

# Copy all files to /app (except what is defined in .dockerignore)
COPY . /app/

# Compile assets and run webpack
# RUN bundle exec rails assets:precompile

# Build runtime image
FROM ruby:2.7.2-alpine as app

# The application runs from /app
WORKDIR /app

# Add postgres driver library
# Add the timezone as it's not configured by default in Alpine
RUN apk add --update --no-cache libpq tzdata && \
  cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
  echo "Europe/London" > /etc/timezone

# Copy files generated in the builder image
COPY --from=build /app /app
COPY --from=build /usr/local/bundle/ /usr/local/bundle/
