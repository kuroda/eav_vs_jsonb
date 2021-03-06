defmodule EavVsJsonb.Repo.Migrations.CreateDsAttributes do
  use Ecto.Migration

  def change do
    create table(:eav_attributes) do
      add :name, :string, null: false
      add :type, :string, null: false

      timestamps()
    end

    create unique_index(:eav_attributes, :name)
  end
end
