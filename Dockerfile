FROM ruby:3.2.2
RUN apt-get update && apt-get install -y \
  libpq-dev
WORKDIR /myapp
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install