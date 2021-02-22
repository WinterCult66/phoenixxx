defmodule Phoenixxx.HelperAccounts.SuperRegards do
  use Ecto.Schema
  import Ecto.Changeset

  schema "superregards" do
    field :regard, :string

    timestamps()
  end

  @doc false
  def changeset(super_regards, attrs) do
    super_regards
    |> cast(attrs, [:regard])
    |> validate_required([:regard])
  end
end
