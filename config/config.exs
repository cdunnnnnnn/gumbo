# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gumbo,
  ecto_repos: [Gumbo.Repo]

# Configures the endpoint
config :gumbo, GumboWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZaK0erEnpLxoGbnUmv4Oaek5YM+KO8inXM79YzPGxUURUNToAr1yrYfwjxmabRB9",
  render_errors: [view: GumboWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gumbo.PubSub, adapter: Phoenix.PubSub.PG2]

# Config Phoenix JSON encoding
config :phoenix, :json_encoding, Jason

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
