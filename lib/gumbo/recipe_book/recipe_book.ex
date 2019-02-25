defmodule Gumbo.RecipeBook do
  @moduledoc """
  The RecipeBook context.
  """

  use Gumbo.Schema

  import Ecto.Query, warn: false
  alias Gumbo.RecipeBook.{Query, Recipe}
  alias Gumbo.Repo

  def list_recipes(%{"search" => query} = params) do
    query
    |> Query.search_recipes()
    |> order_by(:title)
    |> Repo.paginate(params)
  end

  def get_recipe!(id) do
    Recipe
    |> Repo.get!(id)
  end
end
