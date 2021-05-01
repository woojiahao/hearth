# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :hearth, HearthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NN9ZysHYBWjeSgTn1abgqDHQI0OBscDnKfkceib45jQXQxDe+zteCT652IF1PxT0",
  render_errors: [view: HearthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hearth.PubSub,
  live_view: [signing_salt: "i9UrAo6k"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
