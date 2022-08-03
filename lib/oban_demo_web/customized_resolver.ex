defmodule ObanDemoWeb.CustomizedResolver do
  @behaviour Oban.Web.Resolver

  @impl Oban.Web.Resolver
  # :read_only
  def resolve_access(_user), do: :all

  @impl Oban.Web.Resolver
  def resolve_refresh(_user), do: 5
end
