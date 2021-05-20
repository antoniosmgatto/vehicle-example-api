FROM ruby:2.7.2

ENV DEBIAN_FRONTEND=noninteractive

# Upgrade system and install utilities
RUN apt-get update --fix-missing && \
    apt-get -y upgrade && \
    apt-get -y install  git-core \
                        imagemagick \
                        libpq-dev \
                        vim \
                        && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV EDITOR /usr/bin/vim
ENV BUNDLE_PATH /bundle

RUN gem update --system
RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./
ENTRYPOINT [ "./docker-entrypoint.sh" ]