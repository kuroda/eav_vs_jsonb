#!/bin/bash
set -eu

export MIX_ENV=test
export RECORDS=100
export TIMEFORMAT=%R

mix ecto.migrate.reset

time mix run priv/repo/seeds/simple.exs
time mix run priv/repo/seeds/jsonb.exs
time mix run priv/repo/seeds/eav.exs

time mix run priv/repo/updates/simple.exs
time mix run priv/repo/updates/jsonb.exs
