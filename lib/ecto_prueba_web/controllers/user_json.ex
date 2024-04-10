defmodule EctoPruebaWeb.UserJSON do
  alias EctoPrueba.Users.User

  def index(%{users: users}) do
    user_list =
      for user <- users do
        user_data(user)
      end

    %{
      success: true,
      data: user_list
    }
  end

  def user_data(%User{} = user) do
    %{
      username: user.username
    }
  end

  def user_show(%{user: %User{} = user}) do
    %{
      success: true,
      data: user_to_show(user)
    }
  end

  def user_to_show(%User{} = user) do
    %{
      username: user.username,
      name: user.name,
      surname: user.surname,
      age: user.age,
      active: user.active,
      complete_name: User.complete_name(user)
    }
  end
end
