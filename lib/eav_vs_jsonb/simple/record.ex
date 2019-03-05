defmodule EavVsJsonb.Simple.Record do
  use Ecto.Schema

  schema "simple_records" do
    field :a, :string
    field :b, :string
    field :i, :integer
    field :j, :integer

    timestamps()
  end
end
