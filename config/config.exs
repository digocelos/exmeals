# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exmeals,
  ecto_repos: [Exmeals.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :exmeals, ExmealsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7oREK0CIzxhPPwTOumG3gn3VN57vEO29iL7ODXmGjsEYSd96zT+hknPTVcGYomFY",
  render_errors: [view: ExmealsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Exmeals.PubSub,
  live_view: [signing_salt: "AxAPfkpj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
