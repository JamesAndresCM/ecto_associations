defmodule Streamovies.Repo.Migrations.CreateMetadatas do
  use Ecto.Migration

  def change do
    create table(:metadatas) do
      add :description, :string
      add :series_id, references(:series, on_delete: :nothing)

      timestamps()
    end

    create index(:metadatas, [:series_id])
  end
end
