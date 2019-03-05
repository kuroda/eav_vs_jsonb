alias EavVsJsonb.Repo
alias EavVsJsonb.Simple.Record

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  record = Repo.get_by!(Record, j: i)

  record
  |> Record.changeset(%{a: "A"})
  |> Repo.update()
end
