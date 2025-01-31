defmodule EctoPrueba.Users do
  @moduledoc """
  Contexto de usuarios
  """

  import Ecto.Query

  alias EctoPrueba.Repo
  alias EctoPrueba.Users.User

  @type username :: String.t()

  @spec all :: [User.t()]
  def all do
    User
    # |> select([u], %User{name: u.name, surname: u.surname, age: u.age})
    |> Repo.all()
  end

  @spec get(username()) :: User.t() | nil
  def get(username) do
    User
    |> where([u], u.username == ^username)
    |> Repo.one()
  end

  # PRACTICA PRELOAD
  @spec get_with_blogs(username()) :: %User{} | nil
  def get_with_blogs(username) do
    User
    |> where([u], u.username == ^username)
    |> preload(:blogs)
    |> Repo.one()
  end

  def get_inactive_adults() do
    User
    |> where([u], u.active == false or u.age <= 18)
    |> where([u], u.name == "Axel")
    |> Repo.all()
  end

  # CURIOSIDAD
  def get_users_by_params(params) do
    # DSL
    # query =
    #   from u in User,
    #     where: u.age >= 18,
    #     select: u.name

    User
    |> where([u], ^params)
    |> Repo.all()
  end

  @spec insert(map()) :: {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  def insert(attrs) do
    attrs
    |> User.create_changeset()
    |> Repo.insert()
  end

  def toggle_active(%User{} = user, active?) when is_boolean(active?) do
    user
    |> User.update_status_changeset(%{active: active?})
    |> Repo.update()
  end
end
