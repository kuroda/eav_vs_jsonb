defmodule EavVsJsonb.Repo.Migrations.CreateEavEntities do
  use Ecto.Migration

  def change do
    create table(:eav_entities) do
      add :name, :string, null: false

      timestamps()
    end

    create index(:eav_entities, :name)
  end
end
