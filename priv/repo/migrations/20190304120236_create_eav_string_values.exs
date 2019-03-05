defmodule EavVsJsonb.Repo.Migrations.CreateEavStringValues do
  use Ecto.Migration

  def change do
    create table(:eav_string_values) do
      add :entity_id, references("eav_entities"), null: false
      add :attribute_id, references("eav_attributes"), null: false
      add :value, :string, null: false

      timestamps()
    end

    create unique_index(:eav_string_values, [:entity_id, :attribute_id])
    create index(:eav_string_values, [:attribute_id, :value])
  end
end
