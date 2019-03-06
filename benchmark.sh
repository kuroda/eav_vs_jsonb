#!/bin/bash
set -eu

export MIX_ENV=dev
export RECORDS=10
export TIMEFORMAT=%R

mix ecto.migrate.reset

time mix run priv/repo/seeds/simple.exs
time mix run priv/repo/seeds/jsonb.exs
time mix run priv/repo/seeds/eav.exs

time mix run priv/repo/updates/simple.exs
time mix run priv/repo/updates/jsonb.exs
time mix run priv/repo/updates/eav.exs

time mix run priv/repo/selects/simple.exs
time mix run priv/repo/selects/jsonb.exs
time mix run priv/repo/selects/eav.exs

time mix run priv/repo/sort/simple.exs
time mix run priv/repo/sort/jsonb.exs
