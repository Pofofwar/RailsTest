FROM ruby:2.5.1x`
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /railstest
WORKDIR /railstest
COPY Gemfile /railstest/Gemfile
COPY Gemfile.lock /railstest/Gemfile.lock
RUN bundle install
COPY . /railstest