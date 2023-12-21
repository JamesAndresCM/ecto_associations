defmodule Streamovies.MultimediaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Streamovies.Multimedia` context.
  """

  @doc """
  Generate a serie.
  """
  def serie_fixture(attrs \\ %{}) do
    {:ok, serie} =
      attrs
      |> Enum.into(%{
        description: "some description",
        img: "some img",
        name: "some name",
        release_date: ~D[2023-12-15]
      })
      |> Streamovies.Multimedia.create_serie()

    serie
  end

  @doc """
  Generate a video.
  """
  def video_fixture(attrs \\ %{}) do
    {:ok, video} =
      attrs
      |> Enum.into(%{
        duration: "some duration",
        name: "some name",
        resolution: "some resolution",
        video: "some video"
      })
      |> Streamovies.Multimedia.create_video()

    video
  end

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Streamovies.Multimedia.create_category()

    category
  end

  @doc """
  Generate a meta_data.
  """
  def meta_data_fixture(attrs \\ %{}) do
    {:ok, meta_data} =
      attrs
      |> Enum.into(%{
        description: "some description"
      })
      |> Streamovies.Multimedia.create_meta_data()

    meta_data
  end
end
