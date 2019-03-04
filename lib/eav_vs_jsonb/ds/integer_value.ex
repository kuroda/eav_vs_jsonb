defmodule EavVsJsonb.DS.IntegerValue do
  use Ecto.Schema
  alias EavVsJsonb.DS

  schema "ds_integer_values" do
    belongs_to :entity, DS.Entity
    belongs_to :attribute, DS.Attribute
    field :value, :integer

    timestamps()
  end
end
