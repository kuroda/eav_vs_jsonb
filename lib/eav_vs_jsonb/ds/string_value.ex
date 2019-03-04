defmodule EavVsJsonb.DS.StringValue do
  use Ecto.Schema
  alias EavVsJsonb.DS

  schema "ds_string_values" do
    belongs_to :entity, DS.Entity
    belongs_to :attribute, DS.Attribute
    field :value, :string

    timestamps()
  end
end
