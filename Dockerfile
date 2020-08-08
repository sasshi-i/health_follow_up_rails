FROM ruby:2.7.1

ENV LANG ja_JP.UTF-8
ENV RUBYOPT -EUTF-8
ENV PAGER busybox less
RUN apt-get update && apt-get install -y \
  vim \
  nodejs \
  dnsutils \
  net-tools \
  locales \
  wget \
  lsb-release \
  gnupg \
  cron \
  default-mysql-client \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler
RUN mkdir /health-fu-api
WORKDIR /health-fu-api

ADD Gemfile /health-fu-api/Gemfile
ADD Gemfile.lock /health-fu-api/Gemfile.lock

RUN bundle install --jobs=4
ADD . /health-fu-api

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
