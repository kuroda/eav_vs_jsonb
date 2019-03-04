FROM elixir:1.8.1

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install bash vim sudo

ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID devel
RUN useradd -u $UID -g devel -m devel
RUN echo "devel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir -p /app

USER devel

WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force
