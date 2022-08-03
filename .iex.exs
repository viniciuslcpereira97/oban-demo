alias ObanDemo.{User, Notification, Repo}
alias ObanDemo.{FreeOban, ObanPro}

# Create User Workflow
user_data = %{name: "Oban Demo", email: "oban.demo@solfacil.com.br"}
user = User.changeset(%User{}, user_data)

# Notification Batch
user_batch = [
  %{"email" => "dev@solfacil.com.br"},
  %{"email" => "backend@solfacil.com.br"},
  %{"email" => "frontend@solfacil.com.br"}
]
