FROM timbru31/ruby-node:slim

MAINTAINER Florian Dejonckheere <florian@floriandejonckheere.be>

RUN apt-get update && apt-get install -y git build-essential libpq-dev libxml2-dev libxslt1-dev

ENV APP_HOME /app/
ENV RAILS_ENV production

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler

ADD Gemfile* $APP_HOME

RUN bundle install --deployment --without development test

ADD . $APP_HOME

# Precompile assets
RUN DB_ADAPTER=nulldb SECRET_KEY_BASE=foo bundle exec rake assets:clobber
RUN DB_ADAPTER=nulldb SECRET_KEY_BASE=foo bundle exec rake assets:precompile

EXPOSE 3000

CMD ["/app/docker-entrypoint.sh"]
CMD ["bundle", "exec", "puma", "-p", "3000"]
