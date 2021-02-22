defmodule Phoenixxx.Repo.Migrations.CreateRegards do
  use Ecto.Migration

  def change do
    create table(:regards) do
      add :regard, :string
      add :regardN, :integer

      timestamps()
    end

  end
end
