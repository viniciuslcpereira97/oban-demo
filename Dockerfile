FROM bitwalker/alpine-elixir:latest AS build

RUN apk update \
    && apk add --no-cache tzdata ncurses-libs postgresql-client build-base inotify-tools

RUN mkdir /root/.ssh

WORKDIR /app

ARG MIX_ENV=dev
ARG OBAN_PRO_LICENSE_KEY
ARG OBAN_PRO_KEY_FINGERPRINT

RUN mix do local.hex --force, local.rebar --force

RUN mix hex.repo add oban https://getoban.pro/repo \
  --fetch-public-key $OBAN_PRO_KEY_FINGERPRINT \
  --auth-key $OBAN_PRO_LICENSE_KEY

COPY . ./
COPY mix.exs mix.lock ./
COPY config config

RUN mix do deps.get

RUN mix do compile --warnings-as-errors