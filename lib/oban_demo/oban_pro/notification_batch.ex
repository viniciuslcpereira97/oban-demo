defmodule ObanDemo.ObanPro.NotificationBatch do
  use Oban.Pro.Workers.Batch,
    queue: :notification

  alias ObanDemo.{Notification, Repo}

  @impl Oban.Pro.Worker
  def process(%Oban.Job{args: %{"email" => target}}) do
    data = %{target: target}

    %Notification{}
    |> Notification.changeset(data)
    |> Repo.insert()
  end
end
