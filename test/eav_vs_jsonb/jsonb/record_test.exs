defmodule EavVsJsonb.JSONB.RecordTest do
  use ExUnit.Case
  use EavVsJsonb.DataCase
  import EavVsJsonb.Repo
  alias EavVsJsonb.JSONB.Record

  def create_record(a, b, i, j) do
    insert!(%Record{
      data: %{
        a: a,
        b: b,
        i: i,
        j: j
      }
    })
  end

  test "get a record using literal containment syntax" do
    create_record("test", "alpha", 123, 1)

    i = 123

    r = Ecto.Adapters.SQL.query!(Repo, """
      SELECT data FROM jsonb_records WHERE data @> '{"i": #{i}}'
    """)

    data = r.rows |> Enum.at(0) |> Enum.at(0)

    assert data["a"] == "test"
    assert data["b"] == "alpha"
    assert data["i"] == 123
    assert data["j"] == 1
  end

  test "get a record using ->> syntax" do
    create_record("test", "alpha", 123, 1)

    i = "123"

    r =
      Record
      |> where(fragment("data->>? = ?", "i", ^i))
      |> Repo.one()

    data = r.data

    assert data["a"] == "test"
    assert data["b"] == "alpha"
    assert data["i"] == 123
    assert data["j"] == 1
  end

  test "cannot get a record using containment syntax with ?" do
    create_record("test", "alpha", 123, 1)

    assert_raise Postgrex.Error, ~r/Token "\$" is invalid\./, fn ->
      i = 123

      Record
      |> where(fragment(~s(data @> '{"i": ?}'), ^i))
      |> Repo.one()
    end
  end

  test "get a record using @> syntax (failure)" do
    create_record("test", "alpha", 123, 1)

    json = ~s({"i": 123})

    r =
      Record
      |> where(fragment(~s(data @> ?), ^json))
      |> Repo.one()

    assert r == nil
  end

  test "get a record using @> syntax (success)" do
    create_record("test", "alpha", 123, 1)

    map = %{"i" => 123}

    r =
      Record
      |> where(fragment(~s(data @> ?), ^map))
      |> Repo.one()

    data = r.data

    assert data["a"] == "test"
    assert data["b"] == "alpha"
    assert data["i"] == 123
    assert data["j"] == 1
  end
end
