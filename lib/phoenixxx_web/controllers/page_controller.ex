defmodule PhoenixxxWeb.PageController do
  use PhoenixxxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
