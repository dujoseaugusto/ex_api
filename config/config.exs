# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_api,
  ecto_repos: [ExApi.Repo]

# Configures the endpoint
config :ex_api, ExApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fhrmkgaW7h3p1Q5cAPoDlBZOPPXbHb3+OzLqXrrpTWC/W50yvY3i5AgI7Hcu9JNw",
  render_errors: [view: ExApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExApi.PubSub,
  live_view: [signing_salt: "voABa6Xt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
