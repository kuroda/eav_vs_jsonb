defmodule EavVsJsonb.Repo.Migrations.CreateDsIntegerValues do
  use Ecto.Migration

  def change do
    create table(:ds_integer_values) do
      add :entity_id, references("ds_entities"), null: false
      add :attribute_id, references("ds_attributes"), null: false
      add :value, :integer, null: false

      timestamps()
    end

    create unique_index(:ds_integer_values, [:entity_id, :attribute_id])
    create index(:ds_integer_values, [:attribute_id, :value])
  end
end
