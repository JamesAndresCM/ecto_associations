defmodule Streamovies.Multimedia.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :name, :string
    field :video, :string
    field :duration, :string
    field :resolution, :string
    field :delete, :boolean, virtual: true
    belongs_to :serie, Streamovies.Multimedia.Serie, foreign_key: :series_id
    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:name, :video, :duration, :resolution, :delete])
    |> set_delete_action
    |> validate_required([:name])
  end

  defp set_delete_action(changeset) do
    if get_change(changeset, :delete) do
      %{changeset | action: :delete}
    else
      changeset
    end
  end
end
