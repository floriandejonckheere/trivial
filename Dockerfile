FROM floriandejonckheere/docker-ruby-node:2.4.0

MAINTAINER Florian Dejonckheere <florian@floriandejonckheere.be>

# Create user and group
RUN useradd trivial --create-home --home-dir /app/ --shell /bin/false

WORKDIR /app/
ENV RAILS_ENV production

# Install Gem dependencies
ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN gem install bundler

RUN bundle install --deployment --without development test

# Precompile assets
RUN DB_ADAPTER=nulldb SECRET_KEY_BASE=foo bundle exec rake assets:clobber
RUN DB_ADAPTER=nulldb SECRET_KEY_BASE=foo bundle exec rake assets:precompile

# Add application
ADD . /app/

CMD ["/app/docker-entrypoint.sh"]
