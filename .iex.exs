alias ObanDemo.{User, Notification, Repo}
alias ObanDemo.{FreeOban, ObanPro}

user_data = %{name: "Oban Demo", email: "oban.demo@solfacil.com.br"}

user = User.changeset(%User{}, user_data)
