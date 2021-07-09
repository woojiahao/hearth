defmodule HearthWeb.IndexController do
  use HearthWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", hash: nil, error: nil)
  end
end
