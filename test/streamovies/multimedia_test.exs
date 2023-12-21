defmodule Streamovies.MultimediaTest do
  use Streamovies.DataCase

  alias Streamovies.Multimedia

  describe "series" do
    alias Streamovies.Multimedia.Serie

    import Streamovies.MultimediaFixtures

    @invalid_attrs %{name: nil, description: nil, img: nil, release_date: nil}

    test "list_series/0 returns all series" do
      serie = serie_fixture()
      assert Multimedia.list_series() == [serie]
    end

    test "get_serie!/1 returns the serie with given id" do
      serie = serie_fixture()
      assert Multimedia.get_serie!(serie.id) == serie
    end

    test "create_serie/1 with valid data creates a serie" do
      valid_attrs = %{name: "some name", description: "some description", img: "some img", release_date: ~D[2023-12-15]}

      assert {:ok, %Serie{} = serie} = Multimedia.create_serie(valid_attrs)
      assert serie.name == "some name"
      assert serie.description == "some description"
      assert serie.img == "some img"
      assert serie.release_date == ~D[2023-12-15]
    end

    test "create_serie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_serie(@invalid_attrs)
    end

    test "update_serie/2 with valid data updates the serie" do
      serie = serie_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", img: "some updated img", release_date: ~D[2023-12-16]}

      assert {:ok, %Serie{} = serie} = Multimedia.update_serie(serie, update_attrs)
      assert serie.name == "some updated name"
      assert serie.description == "some updated description"
      assert serie.img == "some updated img"
      assert serie.release_date == ~D[2023-12-16]
    end

    test "update_serie/2 with invalid data returns error changeset" do
      serie = serie_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_serie(serie, @invalid_attrs)
      assert serie == Multimedia.get_serie!(serie.id)
    end

    test "delete_serie/1 deletes the serie" do
      serie = serie_fixture()
      assert {:ok, %Serie{}} = Multimedia.delete_serie(serie)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_serie!(serie.id) end
    end

    test "change_serie/1 returns a serie changeset" do
      serie = serie_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_serie(serie)
    end
  end

  describe "videos" do
    alias Streamovies.Multimedia.Video

    import Streamovies.MultimediaFixtures

    @invalid_attrs %{name: nil, video: nil, duration: nil, resolution: nil}

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Multimedia.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Multimedia.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      valid_attrs = %{name: "some name", video: "some video", duration: "some duration", resolution: "some resolution"}

      assert {:ok, %Video{} = video} = Multimedia.create_video(valid_attrs)
      assert video.name == "some name"
      assert video.video == "some video"
      assert video.duration == "some duration"
      assert video.resolution == "some resolution"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      update_attrs = %{name: "some updated name", video: "some updated video", duration: "some updated duration", resolution: "some updated resolution"}

      assert {:ok, %Video{} = video} = Multimedia.update_video(video, update_attrs)
      assert video.name == "some updated name"
      assert video.video == "some updated video"
      assert video.duration == "some updated duration"
      assert video.resolution == "some updated resolution"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_video(video, @invalid_attrs)
      assert video == Multimedia.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Multimedia.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_video(video)
    end
  end

  describe "categories" do
    alias Streamovies.Multimedia.Category

    import Streamovies.MultimediaFixtures

    @invalid_attrs %{name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Multimedia.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Multimedia.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Category{} = category} = Multimedia.create_category(valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Category{} = category} = Multimedia.update_category(category, update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_category(category, @invalid_attrs)
      assert category == Multimedia.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Multimedia.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_category(category)
    end
  end

  describe "metadatas" do
    alias Streamovies.Multimedia.MetaData

    import Streamovies.MultimediaFixtures

    @invalid_attrs %{description: nil}

    test "list_metadatas/0 returns all metadatas" do
      meta_data = meta_data_fixture()
      assert Multimedia.list_metadatas() == [meta_data]
    end

    test "get_meta_data!/1 returns the meta_data with given id" do
      meta_data = meta_data_fixture()
      assert Multimedia.get_meta_data!(meta_data.id) == meta_data
    end

    test "create_meta_data/1 with valid data creates a meta_data" do
      valid_attrs = %{description: "some description"}

      assert {:ok, %MetaData{} = meta_data} = Multimedia.create_meta_data(valid_attrs)
      assert meta_data.description == "some description"
    end

    test "create_meta_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_meta_data(@invalid_attrs)
    end

    test "update_meta_data/2 with valid data updates the meta_data" do
      meta_data = meta_data_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %MetaData{} = meta_data} = Multimedia.update_meta_data(meta_data, update_attrs)
      assert meta_data.description == "some updated description"
    end

    test "update_meta_data/2 with invalid data returns error changeset" do
      meta_data = meta_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_meta_data(meta_data, @invalid_attrs)
      assert meta_data == Multimedia.get_meta_data!(meta_data.id)
    end

    test "delete_meta_data/1 deletes the meta_data" do
      meta_data = meta_data_fixture()
      assert {:ok, %MetaData{}} = Multimedia.delete_meta_data(meta_data)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_meta_data!(meta_data.id) end
    end

    test "change_meta_data/1 returns a meta_data changeset" do
      meta_data = meta_data_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_meta_data(meta_data)
    end
  end
end
