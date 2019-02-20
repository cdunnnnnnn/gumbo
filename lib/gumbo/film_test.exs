defmodule Gumbo.FilmTest do
  use Gumbo.DataCase, async: true

  alias Gumbo.Film

  @params %{
    director: "some director",
    episode_id: 42,
    open_crawl: "some open_crawl",
    producer: "some producer",
    release_date: ~D[2010-04-17],
    title: "some title"
  }

  test "changeset with valid attributes" do
    changeset = Film.changeset(%Film{}, @param)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Film.changeset(%Film{}, @params)
    refute changeset.valid?
  end
end
