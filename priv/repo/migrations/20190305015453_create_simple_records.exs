defmodule EavVsJsonb.Repo.Migrations.CreateSimpleRecords do
  use Ecto.Migration

  def change do
    create table(:simple_records) do
      add :a, :string, null: false
      add :b, :string, null: false
      add :i, :integer, null: false
      add :j, :integer, null: false

      timestamps()
    end

    create index(:simple_records, [:a, :b, :i, :j])
    create index(:simple_records, [:b, :i, :j])
    create index(:simple_records, [:i, :j])
  end
end
