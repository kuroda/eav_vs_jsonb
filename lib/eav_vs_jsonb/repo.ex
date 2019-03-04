defmodule EavVsJsonb.Repo do
  use Ecto.Repo,
    otp_app: :eav_vs_jsonb,
    adapter: Ecto.Adapters.Postgres
end
