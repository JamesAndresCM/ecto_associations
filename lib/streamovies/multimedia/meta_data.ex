defmodule Streamovies.Multimedia.MetaData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "metadatas" do
    field :description, :string
    field :series_id, :id
    field :delete, :boolean, virtual: true
    timestamps()
  end

  @doc false
  def changeset(meta_data, attrs) do
    meta_data
    |> cast(attrs, [:description, :delete])
    |> set_delete_action
    |> validate_required([:description])
  end

  defp set_delete_action(changeset) do
    if get_change(changeset, :delete) do
      %{changeset | action: :delete}
    else
      changeset
    end
  end
end
