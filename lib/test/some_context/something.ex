defmodule Test.SomeContext.Something do
  use Ecto.Schema
  import Ecto.Changeset

  schema "somethings" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(something, attrs) do
    something
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
