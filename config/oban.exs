import Config

config :oban_demo, Oban,
  repo: ObanDemo.Repo,
  engine: Oban.Pro.Queue.SmartEngine,
  plugins: [
    Oban.Plugins.Gossip,
    Oban.Web.Plugins.Stats,
    {Oban.Pro.Plugins.DynamicLifeline, rescue_interval: :timer.minutes(2)},
    {
      Oban.Pro.Plugins.DynamicPruner,
      queue_overrides: [
        default: {:max_age, {1, :minutes}},
        notification: {:max_len, 2}
      ]
    },
    {
      Oban.Plugins.Cron,
      crontab: [
        {"* * * * *", ObanDemo.FreeOban.Notify,
         args: %{target: "admin@solfacil.com.br"}, max_attempts: 2}
      ]
    }
  ],
  queues: [
    default: [limit: 10],
    user: [limit: 10],
    notification: [limit: 10]
  ]
