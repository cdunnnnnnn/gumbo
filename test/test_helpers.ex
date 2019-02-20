defmodule Gumbo.TestHelpers do
  @moduledoc false

  alias Gumbo.Film

  alias Gumbo.Repo

  @spec film_params(Gumbo.fields()) :: Gumbo.params()
  def film_params(fields \\ []),
    do:
      Enum.into(fields, %{
        director: "some director",
        episode_id: 42,
        open_crawl: "some open_crawl",
        producer: "some producer",
        release_date: ~D[2010-04-17],
        title: "some title"
      })
end
