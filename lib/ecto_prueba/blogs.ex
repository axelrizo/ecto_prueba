defmodule EctoPrueba.Blogs do
  import Ecto.Query

  alias EctoPrueba.Users.User
  alias EctoPrueba.Blogs.Blog
  alias EctoPrueba.Repo

  @spec insert(User.t(), map()) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def insert(%User{id: user_id}, attrs) do
    user_id
    |> Blog.create_changeset(attrs)
    |> Repo.insert()
  end

  @spec all_by_user(User.t() | User.username()) :: [Blog.t()]
  def all_by_user(%User{id: user_id}) do
    Blog
    |> where([b], b.user_id == ^user_id)
    |> Repo.all()
  end

  def all_by_user(username) do
    Blog
    |> join(:inner, [b], u in assoc(b, :user))
    |> where([_b, u], u.username == ^username)
    |> Repo.all()
  end
end
