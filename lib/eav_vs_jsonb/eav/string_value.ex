defmodule EavVsJsonb.EAV.StringValue do
  use Ecto.Schema
  alias EavVsJsonb.EAV

  schema "eav_string_values" do
    belongs_to :entity, EAV.Entity
    belongs_to :attribute, EAV.Attribute
    field :value, :string

    timestamps()
  end
end
