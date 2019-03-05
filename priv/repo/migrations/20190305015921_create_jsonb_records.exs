defmodule EavVsJsonb.Repo.Migrations.CreateJsonbRecords do
  use Ecto.Migration

  def change do
    create table(:jsonb_records) do
      add :data, :map

      timestamps()
    end

    execute """
      CREATE INDEX idx_jsonb_r_abcd ON jsonb_records
      USING GIN (data jsonb_path_ops)
    """
  end
end
