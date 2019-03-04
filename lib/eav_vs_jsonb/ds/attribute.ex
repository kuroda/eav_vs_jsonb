defmodule EavVsJsonb.DS.Attribute do
  use Ecto.Schema

  schema "ds_attributes" do
    field :name, :string
    field :type, :string

    timestamps()
  end
end
