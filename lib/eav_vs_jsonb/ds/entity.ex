defmodule EavVsJsonb.DS.Entity do
  use Ecto.Schema

  schema "ds_entities" do
    field :name, :string

    timestamps()
  end
end
