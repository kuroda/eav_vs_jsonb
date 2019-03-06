#!/bin/bash
set -eu

export MIX_ENV=dev
export RECORDS=1000
export TIMEFORMAT=%R

mix ecto.migrate.reset

time mix run priv/repo/seeds/simple.exs
time mix run priv/repo/sort/simple-1.exs
time mix run priv/repo/sort/simple-2.exs
