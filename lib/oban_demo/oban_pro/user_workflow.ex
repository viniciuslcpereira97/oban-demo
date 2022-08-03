defmodule ObanDemo.ObanPro.UserWorkflow do
  alias ObanDemo.User
  alias ObanDemo.ObanPro.{CreateUser, Notify}

  def create_user(%User{} = user) do
    notification_data = %{"target" => user.email}
    user_data = %{"name" => user.name, "email" => user.email}

    CreateUser.new_workflow()
    |> CreateUser.add(:create_user, CreateUser.new(user_data))
    |> CreateUser.add(:notify, Notify.new(notification_data), deps: [:create_user])
  end
end
