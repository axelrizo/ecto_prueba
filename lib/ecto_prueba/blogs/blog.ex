defmodule EctoPrueba.Blogs.Blog do
  use Ecto.Schema

  import Ecto.Changeset

  alias EctoPrueba.Users.User

  schema "blogs" do
    field :title, :string
    field :content, :string

    belongs_to :user, User

    timestamps()
  end

  def get_short_content(%__MODULE__{} = blog, length \\ 5) do
    blog.content
    |> String.split(" ")
    |> Enum.take(length)
    |> Enum.join(" ")
  end

  def create_changeset(user_id, attrs) when is_map(attrs) do
    %__MODULE__{user_id: user_id}
    |> cast(attrs, [:title, :content])
    |> validate_required([:user_id, :title, :content])
  end
end
