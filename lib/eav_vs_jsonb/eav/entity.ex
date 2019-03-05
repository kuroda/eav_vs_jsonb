defmodule EavVsJsonb.EAV.Entity do
  use Ecto.Schema

  schema "eav_entities" do
    field :name, :string

    timestamps()
  end
end
