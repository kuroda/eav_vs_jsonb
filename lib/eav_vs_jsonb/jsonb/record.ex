defmodule EavVsJsonb.JSONB.Record do
  use Ecto.Schema
  alias EavVsJsonb.JSONB

  schema "jsonb_records" do
    field :data, :map

    timestamps()

    has_many :string_values, JSONB.StringValue
  end
end
