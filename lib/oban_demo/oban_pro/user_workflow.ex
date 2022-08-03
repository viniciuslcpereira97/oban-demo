defmodule ObanDemo.ObanPro.UserWorkflow do
  @moduledoc false

  alias ObanDemo.User
  alias ObanDemo.ObanPro.{CreateUser, Notify}

  def create_user(%User{} = user) do
    user_data = %{
      "name" => user.name,
      "email" => user.email
    }

    notification_data = %{"target" => user.email}

    CreateUser.new_workflow()
    |> CreateUser.add(:create_user, CreateUser.new(user_data))
    |> CreateUser.add(:notify, Notify.new(notification_data), deps: [:create_user])
  end

  def create_user_deps(%User{} = user) do
    user_data = %{
      "name" => user.name,
      "email" => user.email
    }

    notification_data = %{"target" => user.email}

    CreateUser.new_workflow()
    |> CreateUser.add("create_user_#{user.name}", CreateUser.new(user_data))
    |> CreateUser.add(:notify, Notify.new(notification_data), deps: ["create_user_#{user.name}"])
  end
end
