defmodule GumboWeb.PageController do
  use GumboWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
