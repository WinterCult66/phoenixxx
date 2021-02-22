defmodule Phoenixxx.Repo.Migrations.Regards do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :regard, :string
      add :regardN,:integer
      timestamps()
  end
end
end
