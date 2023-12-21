defmodule Streamovies.Repo.Migrations.CreateSeries do
  use Ecto.Migration

  def change do
    create table(:series) do
      add :name, :string
      add :img, :string
      add :release_date, :date
      add :description, :string

      timestamps()
    end
  end
end
