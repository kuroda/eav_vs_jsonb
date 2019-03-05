alias EavVsJsonb.Repo

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  Ecto.Adapters.SQL.query!(Repo, """
    UPDATE jsonb_records SET data = jsonb_set(data, '{a}', '"A"')
    WHERE data @> '{"j":#{i}}';
  """)
end
