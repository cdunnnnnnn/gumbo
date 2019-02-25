defmodule GumboWeb.RecipeBookController do
  use GumboWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
