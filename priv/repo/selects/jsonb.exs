import Ecto.Query
alias EavVsJsonb.Repo
alias EavVsJsonb.JSONB.Record

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  map = %{"j" => i}

  r =
    Record
    |> where(fragment("data @> ?", ^map))
    |> Repo.one()

  data = r.data

  if data["j"] != i do
    IO.puts "Wrong!"
    IO.inspect data
  end
end
