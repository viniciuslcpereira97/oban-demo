defmodule ObanDemo.Repo do
  use Ecto.Repo,
    otp_app: :oban_demo,
    adapter: Ecto.Adapters.Postgres
end
