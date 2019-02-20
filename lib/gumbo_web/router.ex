defmodule GumboWeb.Router do
  use GumboWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  if Mix.env() == :dev,
    do:
      forward(
        "/graphiql",
        Absinthe.Plug.GraphiQL,
        schema: GumboWeb.Schema
      )

  scope "/", GumboWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", GumboWeb do
  #   pipe_through :api
  # end
end
