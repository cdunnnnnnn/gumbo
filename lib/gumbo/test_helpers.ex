defmodule Gumbo.TestHelpers do
  @moduledoc false

  alias Gumbo.Recipe

  alias Gumbo.Repo

  @spec recipe_params(Gumbo.fields()) :: Gumbo.params()
  def recipe_params(fields \\ []),
    do:
      Enum.into(fields, %{
        title: "Seafood Gumbo",
        body: "",
        categories: [],
        images: [],
        published_at: ~D[2010-04-17]
      })
end
