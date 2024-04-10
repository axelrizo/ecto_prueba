defmodule EctoPruebaWeb.BlogController do
  use EctoPruebaWeb, :controller

  alias EctoPrueba.Blogs
  alias EctoPrueba.Users
  alias EctoPrueba.Users.User

  def index(conn, %{"username" => username}) do
    case Users.get(username) do
      %User{} = user ->
        blogs = Blogs.all_by_user(user.username)
        render(conn, "index.json", blogs: blogs)

      _ ->
        conn
        |> put_view(json: ErrorJSON)
        |> render("404.json")
    end
  end
end
