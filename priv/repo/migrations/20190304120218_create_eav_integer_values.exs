defmodule EavVsJsonb.Repo.Migrations.CreateEavIntegerValues do
  use Ecto.Migration

  def change do
    create table(:eav_integer_values) do
      add :entity_id, references("eav_entities"), null: false
      add :attribute_id, references("eav_attributes"), null: false
      add :value, :integer, null: false

      timestamps()
    end

    create unique_index(:eav_integer_values, [:entity_id, :attribute_id])
    create index(:eav_integer_values, [:attribute_id, :value])
  end
end
