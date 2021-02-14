# Build compilation image
FROM ruby:2.7.2-alpine3.13

# Set bundler version
ENV BUNDLER_VERSION=2.2.6

# Add the timezone as it's not configured by default in Alpine
RUN apk add --update --no-cache tzdata && \
  cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
  echo "Europe/London" > /etc/timezone

# build-base: complication tools for bundle
# git: version manager
# nodejs: JavaScript runtime built on Chrome's V8 JavaScript engine
# yarn: node package manager
# postgresql-dev: postgres driver and libraries
RUN apk --no-cache add --update \
  build-base \
  git \
  nodejs \
  npm \
  yarn \
  postgresql-dev

# The application runs from /app
WORKDIR /app

# Install bundler and gems defined in Gemfile
COPY .ruby-version Gemfile Gemfile.lock ./
RUN gem update --system \
    && gem install bundler:${BUNDLER_VERSION} --no-document \
    && bundle install --jobs=4 --no-binstubs \
    && gem cleanup

# Install node packages defined in package.json, including webpack
COPY package.json yarn.lock ./
RUN yarn install


# Copy all files to /app (except what is defined in .dockerignore)
COPY . ./

# Compile assets
RUN bundle exec rake assets:precompile
