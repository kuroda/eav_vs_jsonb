alias EavVsJsonb.Repo
alias EavVsJsonb.JSONB.Record
alias EavVsJsonb.JSONB.StringValue

:rand.seed(:exrop, {1, 1, 1})

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  r = rem(i, 4)

  record = Repo.insert!(%Record{
    data: %{
      a: :crypto.hash(:md5, "a-#{i}") |> Base.encode16(case: :lower),
      b: ~w(alpha bravo charlie delta) |> Enum.at(r),
      i: :rand.uniform(1000),
      j: i
    }
  })

  Repo.insert!(%StringValue{
    record_id: record.id,
    field_name: "b",
    value: record.data["b"]
  })
end
