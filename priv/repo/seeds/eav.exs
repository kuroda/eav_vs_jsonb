alias EavVsJsonb.Repo
alias EavVsJsonb.EAV

a1 = Repo.insert!(%EAV.Attribute{name: "a", type: "string"})
a2 = Repo.insert!(%EAV.Attribute{name: "b", type: "string"})
a3 = Repo.insert!(%EAV.Attribute{name: "i", type: "integer"})
a4 = Repo.insert!(%EAV.Attribute{name: "j", type: "integer"})

:rand.seed(:exrop, {1, 1, 1})

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  a = :crypto.hash(:md5, "a-#{i}") |> Base.encode16(case: :lower)
  b = "b-#{i}"
  n = :rand.uniform(1000)

  e = Repo.insert!(%EAV.Entity{name: "record"})

  Repo.insert!(%EAV.StringValue{
    entity_id: e.id,
    attribute_id: a1.id,
    value: a
  })

  Repo.insert!(%EAV.StringValue{
    entity_id: e.id,
    attribute_id: a2.id,
    value: b
  })

  Repo.insert!(%EAV.IntegerValue{
    entity_id: e.id,
    attribute_id: a3.id,
    value: n
  })

  Repo.insert!(%EAV.IntegerValue{
    entity_id: e.id,
    attribute_id: a4.id,
    value: i
  })
end
