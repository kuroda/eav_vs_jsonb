alias EavVsJsonb.Repo
alias EavVsJsonb.Simple.Record

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  Repo.get_by!(Record, j: i)
end
