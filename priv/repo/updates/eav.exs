alias EavVsJsonb.Repo
alias EavVsJsonb.EAV

a1 = Repo.get_by!(EAV.Attribute, name: "a")
a4 = Repo.get_by!(EAV.Attribute, name: "j")

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  Ecto.Adapters.SQL.query!(Repo, """
    UPDATE eav_string_values SET value = 'A'
    FROM eav_string_values s
    JOIN eav_entities e ON e.id = s.entity_id
      AND s.attribute_id = #{a1.id}
    JOIN eav_integer_values i ON e.id = i.entity_id
      AND i.attribute_id = #{a4.id}
    WHERE i.value = #{i};
  """)
end
