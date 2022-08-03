import Config

config :oban_demo,
  ecto_repos: [ObanDemo.Repo]

config :oban_demo, ObanDemo.Repo,
  username: "solfacil",
  password: "solfacil",
  hostname: "db",
  database: "oban_demo_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :oban_demo, ObanDemoWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ObanDemoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ObanDemo.PubSub,
  live_view: [signing_salt: "SQTDsfCb"]

config :oban_demo, ObanDemoWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "FjAWS4OW+88nyWdYzGkg3LmmTiJN4BJ/UZzu77EXb6nN75tyFR1E/LryvpLY+RpM",
  watchers: []

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

if System.get_env("PHX_SERVER") do
  config :oban_demo, ObanDemoWeb.Endpoint, server: true
end

import_config "oban.exs"
