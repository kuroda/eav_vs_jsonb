defmodule EavVsJsonb.JSONB.Record do
  use Ecto.Schema

  schema "jsonb_records" do
    field :data, :map

    timestamps()
  end
end
