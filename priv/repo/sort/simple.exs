alias EavVsJsonb.Repo
alias EavVsJsonb.Simple.Record
import Ecto.Query

Record
|> order_by(asc: :b, asc: :i)
|> Repo.all()
