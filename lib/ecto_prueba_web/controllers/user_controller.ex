defmodule EctoPruebaWeb.UserController do
  use EctoPruebaWeb, :controller

  alias EctoPrueba.Users
  alias EctoPrueba.Users.User
  alias EctoPruebaWeb.ErrorJSON

  def index(conn, _params) do
    users = Users.all()

    render(conn, "index.json", users: users)
  end

  def show(conn, %{"username" => username}) do
    render(conn, ErrorJSON, "404.json")
  end
end
