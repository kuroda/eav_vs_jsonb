alias EavVsJsonb.Repo

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  r = Ecto.Adapters.SQL.query!(Repo, """
    SELECT data FROM jsonb_records WHERE data @> '{"j":#{i}}'
  """)

  data = r.rows |> Enum.at(0) |> Enum.at(0)

  if data["j"] != i do
    IO.puts "Wrong!"
  end
end
