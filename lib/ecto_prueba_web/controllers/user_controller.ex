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
    case Users.get(username) do
      %User{} = user ->
        render(conn, "user_show.json", user: user)

      nil ->
        conn
        |> put_view(json: ErrorJSON)
        |> render("404.json")
    end
  end
end
