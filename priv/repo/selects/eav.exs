alias EavVsJsonb.Repo
alias EavVsJsonb.EAV

a1 = Repo.get_by!(EAV.Attribute, name: "a")
a2 = Repo.get_by!(EAV.Attribute, name: "b")
a3 = Repo.get_by!(EAV.Attribute, name: "i")
a4 = Repo.get_by!(EAV.Attribute, name: "j")

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  r = Ecto.Adapters.SQL.query!(Repo, """
    SELECT s1.value, s2.value, i1.value, i2.value
    FROM eav_entities e
    JOIN eav_string_values s1 ON s1.entity_id = e.id
      AND s1.attribute_id = #{a1.id}
    JOIN eav_string_values s2 ON s2.entity_id = e.id
      AND s2.attribute_id = #{a2.id}
    JOIN eav_integer_values i1 ON i1.entity_id = e.id
      AND i1.attribute_id = #{a3.id}
    JOIN eav_integer_values i2 ON i2.entity_id = e.id
      AND i2.attribute_id = #{a4.id}
    WHERE i2.value = #{i};
  """)

  j = r.rows |> Enum.at(0) |> Enum.at(3)

  if j != i do
    IO.puts "Wrong!"
  end
end
