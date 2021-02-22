defmodule Phoenixxx.Regardsx.Regards do
  use Ecto.Schema
  import Ecto.Changeset

  schema "regards" do
    field :regard, :string
    field :regardN, :integer

    timestamps()
  end

  @doc false
  def changeset(regards, attrs) do
    regards
    |> cast(attrs, [:regard, :regardN])
    |> validate_required([:regard, :regardN])
  end
end
