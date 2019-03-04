defmodule EavVsJsonb.Repo.Migrations.CreateDsAttributes do
  use Ecto.Migration

  def change do
    create table(:ds_attributes) do
      add :name, :string, null: false
      add :type, :string, null: false

      timestamps()
    end
  end
end
