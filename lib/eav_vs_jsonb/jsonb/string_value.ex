defmodule EavVsJsonb.JSONB.StringValue do
  use Ecto.Schema
  alias EavVsJsonb.JSONB

  schema "jsonb_string_values" do
    belongs_to :record, JSONB.Record
    field :value, :string
  end
end
