defmodule EavVsJsonb.Repo.Migrations.CreateDsStringValues do
  use Ecto.Migration

  def change do
    create table(:ds_string_values) do
      add :entity_id, references("ds_entities"), null: false
      add :attribute_id, references("ds_attributes"), null: false
      add :value, :string, null: false

      timestamps()
    end

    create unique_index(:ds_string_values, [:entity_id, :attribute_id])
    create index(:ds_string_values, [:attribute_id, :value])
  end
end
