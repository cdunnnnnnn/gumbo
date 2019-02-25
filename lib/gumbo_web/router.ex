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

  scope "/api", GumboWeb do
    pipe_through(:api)

    scope "/v1", V1 do
      resources("/recipes", RecipeController, only: [:index, :show])
    end
  end

  scope "/", GumboWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/*path", RecipeBookController, :index)
  end

  pipeline :force_trailing_slash do
    plug(GumboWeb.ForceTrailingSlashPlug)
  end
end
