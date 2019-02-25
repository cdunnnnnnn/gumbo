defmodule Gumbo.V1.RecipeController do
  @moduledoc """
  The GraphQL boundary
  """
  use GumboWeb, :controller

  alias Gumbo.RecipeBook

  def index(conn, params) do
    recipes = RecipeBook.list_recipes(params)
    json(conn, recipes)
  end

  def show(conn, %{"id" => id}) do
    recipe = RecipeBook.get_recipe!(id)
    json(conn, recipe)
  end
end
