defmodule Phoenixxx.HelperAverage.Average do
  use Ecto.Schema
  import Ecto.Changeset

  schema "average" do
    field :average_of_page, :string
    field :name_of_avg, :string

    timestamps()
  end

  @doc false
  def changeset(average, attrs) do
    average
    |> cast(attrs, [:average_of_page, :name_of_avg])
    |> validate_required([:average_of_page, :name_of_avg])
  end
end
