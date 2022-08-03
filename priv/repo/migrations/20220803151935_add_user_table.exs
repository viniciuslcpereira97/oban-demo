defmodule ObanDemo.Repo.Migrations.AddUserTable do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
