defmodule ObanDemo.FreeOban.Notify do
  use Oban.Worker, queue: :default

  alias ObanDemo.{Notification, Repo}

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"target" => target}}) do
    data = %{target: target}

    %Notification{}
    |> Notification.changeset(data)
    |> Repo.insert()
  end
end
