FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app

# Cache Dependency Install
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Add Repository
ADD . /app

# Run Server
EXPOSE 3000
CMD rake db:migrate && rails server -b 0.0.0.0
