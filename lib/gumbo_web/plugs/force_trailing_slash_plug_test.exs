defmodule GumboWeb.ForceTrailingSlashPlugTest do
  use GumboWeb.ConnCase

  alias GumboWeb.ForceTrailingSlashPlug

  test "non-trailing slash forces redirect", %{conn: conn} do
    conn =
      conn
      |> bypass_through(GumboWeb.Router, :browser)
      |> get("/noslash")
      |> ForceTrailingSlashPlug.call([])

    assert redirected_to(conn, :moved_permanently) === "/noslash/"
  end

  test "trailing slash does not redirect", %{conn: conn} do
    conn =
      conn
      |> bypass_through(GumboWeb.Router, :browser)
      |> get("/allslash/")

    assert conn === ForceTrailingSlashPlug.call(conn, [])
  end
end
