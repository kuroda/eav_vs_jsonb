#!/bin/bash
set -eu

export MIX_ENV=test
export RECORDS=1000
export TIMEFORMAT=%R

mix ecto.migrate.reset

time mix run priv/repo/seeds/simple.exs
time mix run priv/repo/seeds/jsonb.exs
time mix run priv/repo/seeds/eav.exs

time mix run priv/repo/updates/simple.exs
time mix run priv/repo/updates/jsonb.exs
time mix run priv/repo/updates/eav.exs
