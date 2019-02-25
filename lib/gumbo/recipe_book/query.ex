defmodule Gumbo.RecipeBook.Query do
  @moduledoc false

  import Ecto.Query, warn: false

  alias Gumbo.RecipeBook.Recipe

  @recipe_search_tsvector """
  (
    to_tsvector(
      'english',
      coalesce(title, '') || ' ' ||
      coalesce(body, '') || ' ' ||
      coalesce(categories, '') || ' ' ||
      coalesce(images, '') || ' ' ||
      coalesce(published_at, '') || ' ' ||
    )
    @@ to_tsquery('english', ?)
  )
  """

  def search_recipes(""), do: Recipe

  def search_recipes(query) do
    query = tsquery_format(query)

    Recipe
    |> where(fragment(@recipe_search_tsvector, ^query))
  end

  defp tsquery_format(query) do
    query
    |> String.trim()
    |> String.split(" ")
    |> Enum.map(&"#{&1}:*")
    |> Enum.join(" & ")
  end
end
