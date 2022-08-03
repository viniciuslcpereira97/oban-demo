import Config

config :oban_demo, Oban,
  repo: ObanDemo.Repo,
  engine: Oban.Pro.Queue.SmartEngine,
  queues: [
    default: [limit: 10],
    user: [limit: 10, global_limit: 1],
    notification: [limit: 10, [allowed: 1, period: {1, :minute}, partition: [fields: [:worker]]]]
  ],
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
  ]
