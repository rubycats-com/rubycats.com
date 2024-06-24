FROM ruby:3.3.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client net-tools iputils-ping
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app

EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]
