use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :eav_vs_jsonb, EavVsJsonbWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :eav_vs_jsonb, EavVsJsonb.Repo,
  username: "postgres",
  password: "",
  database: "eav_vs_jsonb_test",
  hostname: "db",
  pool_size: 10
