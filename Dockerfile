FROM registry.dejonckhee.re/docker-ruby-node:2.6.5-13.1.0

MAINTAINER Florian Dejonckheere <florian@floriandejonckheere.be>

RUN apk add --no-cache build-base git postgresql-dev libxml2-dev libxslt-dev

ENV APP_HOME /app/
ENV RAILS_ENV production

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler

ADD Gemfile* $APP_HOME

RUN bundle install --deployment --without development test

ADD . $APP_HOME

RUN bundle exec rails assets:precompile SECRET_KEY_BASE=foo

VOLUME $APP_HOME/public/

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bundle", "exec", "puma", "-p", "3000"]
