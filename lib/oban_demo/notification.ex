defmodule ObanDemo.Notification do
  use Ecto.Schema

  import Ecto.Changeset

  @fields ~w(id target)a

  schema "notification" do
    field :target, :string

    timestamps()
  end

  def changeset(%__MODULE__{} = notification, attrs) do
    cast(notification, attrs, @fields)
  end
end
