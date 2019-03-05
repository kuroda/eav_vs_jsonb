defmodule EavVsJsonb.Simple.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "simple_records" do
    field :a, :string
    field :b, :string
    field :i, :integer
    field :j, :integer

    timestamps()
  end

  @field_names [:a, :b, :i, :j]

  def changeset(record, attrs) do
    record
    |> cast(attrs, @field_names)
  end
end
