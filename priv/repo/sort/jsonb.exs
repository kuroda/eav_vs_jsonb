alias EavVsJsonb.Repo

Ecto.Adapters.SQL.query!(Repo, """
  SELECT data FROM jsonb_records
  ORDER BY data->>'b', data->>'i'
""")
