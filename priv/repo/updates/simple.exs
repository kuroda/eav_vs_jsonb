alias EavVsJsonb.Repo

{records, _} = Integer.parse(System.get_env("RECORDS") || "100")

for i <- 1..records do
  Ecto.Adapters.SQL.query!(Repo, """
    UPDATE simple_records SET a = 'A' WHERE j = #{i};
  """)
end
