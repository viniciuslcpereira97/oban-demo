defmodule ObanDemo.FreeOban.CreateUserTest do
  use ObanDemo.DataCase, async: true

  use Oban.Testing, repo: ObanDemo.Repo

  alias ObanDemo.{User, Notification}
  alias ObanDemo.FreeOban.{CreateUser, Notify}

  test "create user and send notification" do
    data = %{email: "example@solfacil.com", name: "User Test"}

    :ok = perform_job(CreateUser, data)

    assert [%User{name: "User Test"}] = ObanDemo.Repo.all(User)
    assert [%Notification{target: "example@solfacil.com"}] = ObanDemo.Repo.all(Notification)
  end
end
