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
      name: User.complete_name(user),
      age: user.age
    }
  end
end
