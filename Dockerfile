FROM rails:latest

MAINTAINER Florian Dejonckheer "<florian@floriandejonckheere.be"

RUN mkdir /app

ENV DB_USER trivial
ENV DB_PASSWORD trivial

ENV RAILS_ENV production

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

ADD . /app
WORKDIR /app
RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["./start.sh"]
