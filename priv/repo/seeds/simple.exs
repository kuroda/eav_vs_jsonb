alias EavVsJsonb.Repo
alias EavVsJsonb.Simple.Record

:rand.seed(:exrop, {1, 1, 1})

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  r = rem(i, 4)

  Repo.insert!(%Record{
    a: :crypto.hash(:md5, "a-#{i}") |> Base.encode16(case: :lower),
    b: ~w(alpha bravo charlie delta) |> Enum.at(r),
    i: :rand.uniform(1000),
    j: i
  })
end
