defmodule ObanDemo.ObanPro.CreateUser do
  use Oban.Pro.Workers.Workflow, queue: :default

  alias ObanDemo.{Repo, User}

  @impl true
  def process(%Oban.Job{args: %{"name" => user_name, "email" => user_email}}) do
    :timer.sleep(20_000)

    data = %{name: user_name, email: user_email}

    %User{}
    |> User.changeset(data)
    |> Repo.insert()
  end
end
