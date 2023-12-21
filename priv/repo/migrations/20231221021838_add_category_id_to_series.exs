defmodule Streamovies.Repo.Migrations.AddCategoryIdToSeries do
  use Ecto.Migration

  def change do
    alter table(:series) do
      add :category_id, references(:categories, on_delete: :nothing)
    end
  end
end
