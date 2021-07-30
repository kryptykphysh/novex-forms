FROM ruby:3 as base
LABEL maintainer=kryptykphysh@kryptykphysh.xyz

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && curl -sS https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
  && apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
  apt-transport-https \
  build-essential \
  nodejs \
  postgresql-client-12 \
  yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /gems

FROM base as base1
COPY ./Gemfile* /usr/src/app/
WORKDIR /usr/src/app
ENV BUNDLE_PATH /gems
RUN gem update --system \
  && gem install bundler \
  && bundle install
COPY . /usr/src/app/
RUN yarn install --check-files \
  && chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
