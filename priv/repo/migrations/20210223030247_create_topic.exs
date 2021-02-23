defmodule Phoenixxx.Repo.Migrations.CreateTopic do
  use Ecto.Migration

  def change do
    create table(:topic) do
      add :title, :string
      add :growth, :string
      add :description, :string

      timestamps()
    end
  end
end
