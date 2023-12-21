defmodule Streamovies.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :name, :string
      add :video, :string
      add :duration, :string
      add :resolution, :string
      add :series_id, references(:series, on_delete: :nothing)

      timestamps()
    end

    create index(:videos, [:series_id])
  end
end
