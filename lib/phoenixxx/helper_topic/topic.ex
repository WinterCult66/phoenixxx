defmodule Phoenixxx.HelperTopic.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topic" do
    field :description, :string
    field :growth, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:title, :growth, :description])
    |> validate_required([:title, :growth, :description])
  end
end
