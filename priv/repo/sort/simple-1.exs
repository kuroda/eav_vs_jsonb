alias EavVsJsonb.Repo
alias EavVsJsonb.Simple.Record
import Ecto.Query

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for _ <- 1..records do
  Record
  |> order_by(asc: :b)
  |> first()
  |> Repo.one()
end
