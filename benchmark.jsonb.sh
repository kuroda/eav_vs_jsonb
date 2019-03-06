#!/bin/bash
set -eu

export MIX_ENV=dev
export RECORDS=1000
export TIMEFORMAT=%R

mix ecto.migrate.reset

time mix run priv/repo/seeds/jsonb.exs
time mix run priv/repo/sort/jsonb-1.exs
time mix run priv/repo/sort/jsonb-2.exs
time mix run priv/repo/sort/jsonb-1-with-index.exs
