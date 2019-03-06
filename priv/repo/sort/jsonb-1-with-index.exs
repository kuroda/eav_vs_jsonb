import Ecto.Query
alias EavVsJsonb.Repo
alias EavVsJsonb.JSONB.Record
alias EavVsJsonb.JSONB.StringValue

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for _ <- 1..records do
  Record
  |> join(:inner, [r], v in StringValue, on: r.id == v.record_id)
  |> order_by([r, v], asc: v.field_name, asc: v.value)
  |> first()
  |> Repo.one()
end
