FROM ruby:2.6.5 
LABEL MAINTAINER=brett@therubytroubadour.com

RUN apt-get update
RUN apt-get install build-essential -y

RUN curl -SL https://deb.nodesource.com/setup_13.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpgp | apt-key add -
RUN echo "deb https://deb.yarnpkg.com/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install nodejs -y
RUN apt-get install yarn -y