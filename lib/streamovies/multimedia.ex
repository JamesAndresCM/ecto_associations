defmodule Streamovies.Multimedia do
  @moduledoc """
  The Multimedia context.
  """

  import Ecto.Query, warn: false
  alias Streamovies.Repo

  alias Streamovies.Multimedia.Serie

  @doc """
  Returns the list of series.

  ## Examples

      iex> list_series()
      [%Serie{}, ...]

  """
  def list_series do
    Repo.all(Serie)
  end

  @doc """
  Gets a single serie.

  Raises `Ecto.NoResultsError` if the Serie does not exist.

  ## Examples

      iex> get_serie!(123)
      %Serie{}

      iex> get_serie!(456)
      ** (Ecto.NoResultsError)

  """
  def get_serie!(id), do: Repo.get!(Serie, id)

  @doc """
  Creates a serie.

  ## Examples

      iex> create_serie(%{field: value})
      {:ok, %Serie{}}

      iex> create_serie(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_serie(attrs \\ %{}) do
    %Serie{}
    |> Serie.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a serie.

  ## Examples
      Dont forget reload serie for new updates
      serie = Repo.get_by(Serie, id: id) |> Repo.preload(:videos)
      up_params = %{videos: [ %{name: "new"}  ] } 
      up_params = %{name: "Thun", category_id: 1, metadata: %{description: "example"}, videos: [ %{id: 2, name: "01"}, %{name: "test"}, %{id: 1, delete: true}  ] }

      iex> update_serie(serie, up_params)
      {:ok, %Serie{}}

      iex> update_serie(serie, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_serie(%Serie{} = serie, attrs) do
    attrs = if Map.has_key?(attrs, :videos) do
      serie_ids = serie.videos |> Enum.map(&(&1.id))
      attr_video_ids = attrs[:videos] |> Enum.map(&(&1[:id]))
      ids = serie_ids -- attr_video_ids |> Enum.map((&%{id: &1}))
      %{attrs | :videos => attrs[:videos] ++ ids}
    else
      attrs
    end

    serie
    |> Serie.changeset(attrs)
    |> Repo.update
  end

  @doc """
  Deletes a serie.

  ## Examples

      iex> delete_serie(serie)
      {:ok, %Serie{}}

      iex> delete_serie(serie)
      {:error, %Ecto.Changeset{}}

  """
  def delete_serie(%Serie{} = serie) do
    Repo.delete(serie)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking serie changes.

  ## Examples

      iex> change_serie(serie)
      %Ecto.Changeset{data: %Serie{}}

  """
  def change_serie(%Serie{} = serie, attrs \\ %{}) do
    Serie.changeset(serie, attrs)
  end

  alias Streamovies.Multimedia.Video

  @doc """
  Returns the list of videos.

  ## Examples

      iex> list_videos()
      [%Video{}, ...]

  """
  def list_videos do
    Repo.all(Video)
  end

  @doc """
  Gets a single video.

  Raises `Ecto.NoResultsError` if the Video does not exist.

  ## Examples

      iex> get_video!(123)
      %Video{}

      iex> get_video!(456)
      ** (Ecto.NoResultsError)

  """
  def get_video!(id), do: Repo.get!(Video, id)

  @doc """
  Creates a video.

  ## Examples

      iex> create_video(%{field: value})
      {:ok, %Video{}}

      iex> create_video(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_video(attrs \\ %{}) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a video.

  ## Examples

      iex> update_video(video, %{field: new_value})
      {:ok, %Video{}}

      iex> update_video(video, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a video.

  ## Examples

      iex> delete_video(video)
      {:ok, %Video{}}

      iex> delete_video(video)
      {:error, %Ecto.Changeset{}}

  """
  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking video changes.

  ## Examples

      iex> change_video(video)
      %Ecto.Changeset{data: %Video{}}

  """
  def change_video(%Video{} = video, attrs \\ %{}) do
    Video.changeset(video, attrs)
  end

  alias Streamovies.Multimedia.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Streamovies.Multimedia.MetaData

  @doc """
  Returns the list of metadatas.

  ## Examples

      iex> list_metadatas()
      [%MetaData{}, ...]

  """
  def list_metadatas do
    Repo.all(MetaData)
  end

  @doc """
  Gets a single meta_data.

  Raises `Ecto.NoResultsError` if the Meta data does not exist.

  ## Examples

      iex> get_meta_data!(123)
      %MetaData{}

      iex> get_meta_data!(456)
      ** (Ecto.NoResultsError)

  """
  def get_meta_data!(id), do: Repo.get!(MetaData, id)

  @doc """
  Creates a meta_data.

  ## Examples

      iex> create_meta_data(%{field: value})
      {:ok, %MetaData{}}

      iex> create_meta_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_meta_data(attrs \\ %{}) do
    %MetaData{}
    |> MetaData.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a meta_data.

  ## Examples

      iex> update_meta_data(meta_data, %{field: new_value})
      {:ok, %MetaData{}}

      iex> update_meta_data(meta_data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_meta_data(%MetaData{} = meta_data, attrs) do
    meta_data
    |> MetaData.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a meta_data.

  ## Examples

      iex> delete_meta_data(meta_data)
      {:ok, %MetaData{}}

      iex> delete_meta_data(meta_data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_meta_data(%MetaData{} = meta_data) do
    Repo.delete(meta_data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking meta_data changes.

  ## Examples

      iex> change_meta_data(meta_data)
      %Ecto.Changeset{data: %MetaData{}}

  """
  def change_meta_data(%MetaData{} = meta_data, attrs \\ %{}) do
    MetaData.changeset(meta_data, attrs)
  end
end
