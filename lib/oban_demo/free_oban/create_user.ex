defmodule ObanDemo.FreeOban.CreateUser do
  use Oban.Worker, queue: :default

  alias ObanDemo.{Repo, User}

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"name" => user_name, "email" => user_email}}) do
    data = %{name: user_name, email: user_email}

    {:ok, user} =
      %User{}
      |> User.changeset(data)
      |> Repo.insert()

    %{"target" => user.email}
    |> ObanDemo.FreeOban.Notify.new()
    |> Oban.insert()
  end
end
