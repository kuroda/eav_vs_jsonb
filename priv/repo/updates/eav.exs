alias EavVsJsonb.Repo
alias EavVsJsonb.EAV

a1 = Repo.get_by!(EAV.Attribute, name: "a")
a4 = Repo.get_by!(EAV.Attribute, name: "j")

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  i = Repo.get_by!(EAV.IntegerValue, attribute_id: a4.id, value: i)

  Ecto.Adapters.SQL.query!(Repo, """
    UPDATE eav_string_values
    SET value = 'A'
    WHERE attribute_id = #{a1.id} AND entity_id = #{i.entity_id}
  """)
end
