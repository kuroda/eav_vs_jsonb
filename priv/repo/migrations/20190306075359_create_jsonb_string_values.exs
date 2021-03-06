defmodule EavVsJsonb.Repo.Migrations.CreateJsonbStringValues do
  use Ecto.Migration

  def change do
    create table(:jsonb_string_values) do
      add :record_id, references("jsonb_records"), null: false
      add :field_name, :string, null: false
      add :value, :string
    end

    create unique_index(:jsonb_string_values, [:record_id, :field_name])
    create index(:jsonb_string_values, [:field_name, :value])
  end
end
