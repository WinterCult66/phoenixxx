defmodule Phoenixxx.Repo.Migrations.CreateSuperregards do
  use Ecto.Migration

  def change do
    create table(:superregards) do
      add :regard, :string

      timestamps()
    end
  end
end
