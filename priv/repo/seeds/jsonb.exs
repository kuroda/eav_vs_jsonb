alias EavVsJsonb.Repo
alias EavVsJsonb.JSONB.Record

:rand.seed(:exrop, {1, 1, 1})

for i <- 1..10 do
  Repo.insert!(%Record{
    data: %{
      a: :crypto.hash(:md5, "a-#{i}") |> Base.encode16(case: :lower),
      b: "b-#{i}",
      i: :rand.uniform(1000),
      j: i
    }
  })
end
