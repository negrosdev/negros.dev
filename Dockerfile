FROM ruby:3.2.0

ENV BUNDLER_VERSION 2.4.15

RUN apt-get update -y
RUN apt-get install -y --no-install-recommends nodejs imagemagick chromium

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
