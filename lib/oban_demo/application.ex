defmodule ObanDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ObanDemo.Repo,
      ObanDemoWeb.Telemetry,
      {Phoenix.PubSub, name: ObanDemo.PubSub},
      # ObanDemoWeb.Endpoint,
      {Oban, oban_configuration()}
    ]

    opts = [strategy: :one_for_one, name: ObanDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    ObanDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_configuration do
    Application.fetch_env!(:oban_demo, Oban)
  end
end
