# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.3
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails

# Install packages needed to build gems
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev libmariadb-dev

RUN gem install bundler

# Install application gems
COPY Gemfile Gemfile.lock ./

RUN bundle install


# Copy application code
COPY . .

# Start the server by default, this can be overwritten at runtime
EXPOSE 3002
CMD ["./bin/rails", "server"]
