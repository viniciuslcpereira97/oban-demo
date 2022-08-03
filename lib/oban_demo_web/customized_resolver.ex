defmodule ObanDemoWeb.CustomizedResolver do
  @behaviour Oban.Web.Resolver

  @impl Oban.Web.Resolver
  def resolve_access(_user), do: :all # :read_only

  @impl Oban.Web.Resolver
  def resolve_refresh(_user), do: 5
end
