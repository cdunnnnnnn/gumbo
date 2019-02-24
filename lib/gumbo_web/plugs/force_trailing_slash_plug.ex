defmodule GumboWeb.ForceTrailingSlashPlug do
  @moduledoc """
  A Plug to rewrite the request path with a trailing slash.
  """

  import Plug.Conn
  import Phoenix.Controller, only: [redirect: 2]

  def init(default), do: default

  def call(conn, _default) do
    if String.ends_with?(conn.request_path, "/") do
      conn
    else
      # Strips leading slashes since sometimes requests
      # start with double slashes (//path),
      # which redirect(to:) doesn't like.
      url = String.trim_leading(conn.request_path, "/")

      conn
      |> put_status(:moved_permanently)
      |> redirect(to: "/" <> url <> "/")
      |> halt()
    end
  end
end
