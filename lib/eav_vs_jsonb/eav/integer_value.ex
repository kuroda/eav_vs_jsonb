defmodule EavVsJsonb.EAV.IntegerValue do
  use Ecto.Schema
  alias EavVsJsonb.EAV

  schema "eav_integer_values" do
    belongs_to :entity, EAV.Entity
    belongs_to :attribute, EAV.Attribute
    field :value, :integer

    timestamps()
  end
end
