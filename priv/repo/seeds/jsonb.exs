alias EavVsJsonb.Repo
alias EavVsJsonb.JSONB.Record

:rand.seed(:exrop, {1, 1, 1})

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  Repo.insert!(%Record{
    data: %{
      a: :crypto.hash(:md5, "a-#{i}") |> Base.encode16(case: :lower),
      b: "b-#{i}",
      i: :rand.uniform(1000),
      j: i
    }
  })
end
