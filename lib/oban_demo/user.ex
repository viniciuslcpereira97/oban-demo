defmodule ObanDemo.User do
  use Ecto.Schema

  import Ecto.Changeset

  @fields ~w(id name email)a

  schema "user" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  def changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, @fields)
    |> apply_action!(:insert)
  end
end
