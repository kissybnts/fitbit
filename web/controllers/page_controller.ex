defmodule Fitbit.PageController do
  use Fitbit.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
