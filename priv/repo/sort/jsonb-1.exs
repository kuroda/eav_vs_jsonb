import Ecto.Query
alias EavVsJsonb.Repo
alias EavVsJsonb.JSONB.Record

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for _ <- 1..records do
  Record
  |> order_by(fragment("data->>'b' ASC"))
  |> first()
  |> Repo.one()
end
