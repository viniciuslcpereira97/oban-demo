defmodule ObanDemo.ObanPro.CreateUserTest do
  use ObanDemo.DataCase, async: true

  use Oban.Testing, repo: ObanDemo.Repo

  test "create a new user" do
    data = %{email: "example@solfacil.com", name: "User Test"}

    {:ok, _result} = perform_job(ObanDemo.ObanPro.CreateUser, data)
  end
end
