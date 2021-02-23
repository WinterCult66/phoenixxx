defmodule Phoenixxx.Repo.Migrations.CreateAverage do
  use Ecto.Migration

  def change do
    create table(:average) do
      add :average_of_page, :string
      add :name_of_avg, :string

      timestamps()
    end
  end
end
