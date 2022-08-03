defmodule ObanDemo.ObanPro.Notify do
  use Oban.Pro.Workers.Workflow, queue: :default

  alias ObanDemo.{Repo, Notification}

  @impl true
  def process(%Oban.Job{args: %{"target" => target}}) do
    data = %{target: target}

    %Notification{}
    |> Notification.changeset(data)
    |> Repo.insert()
  end
end
