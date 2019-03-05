defmodule EavVsJsonb.EAV.Attribute do
  use Ecto.Schema

  schema "eav_attributes" do
    field :name, :string
    field :type, :string

    timestamps()
  end
end
