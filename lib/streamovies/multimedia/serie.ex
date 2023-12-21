defmodule Streamovies.Multimedia.Serie do
  use Ecto.Schema
  import Ecto.Changeset
  alias Streamovies.Multimedia.{Video, Category, MetaData}

  schema "series" do
    field :name, :string
    field :description, :string
    field :img, :string
    field :release_date, :date
    has_many :videos, Video, foreign_key: :series_id, on_delete: :delete_all, on_replace: :nilify
    has_one :metadata, MetaData, foreign_key: :series_id, on_delete: :delete_all
    belongs_to :category, Category
    timestamps()
  end

  @doc false
  def changeset(serie, attrs) do
    serie
    |> cast(attrs, [:name, :img, :release_date, :description, :category_id])
    |> validate_required([:name])
    |> cast_assoc(:videos, with: &Video.changeset/2)
    |> cast_assoc(:metadata, with: &MetaData.changeset/2)
  end
end
