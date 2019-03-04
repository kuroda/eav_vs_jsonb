defmodule EavVsJsonb.Repo.Migrations.CreateDsEntities do
  use Ecto.Migration

  def change do
    create table(:ds_entities) do
      add :name, :string, null: false

      timestamps()
    end
  end
end
