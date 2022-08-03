defmodule ObanDemoWeb.PageController do
  use ObanDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
