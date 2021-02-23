# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenixxx,
  ecto_repos: [Phoenixxx.Repo]

# Configures the endpoint
config :phoenixxx, PhoenixxxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oRa+TTQzNxupKG1fUujGRp54uc22HGb47Cu+faPQVOhMFoydh+hwc2Jj0aSKZMH0",
  render_errors: [view: PhoenixxxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phoenixxx.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

##### JOB EVERY SECOND
config :phoenixxx, Job.Scheduler,
  jobs: [
    {"* * * * *", {ExplodingTopics2, :task_of_topics, []}}
  ]

##### JOB EVERY SECOND

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
