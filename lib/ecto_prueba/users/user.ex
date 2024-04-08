defmodule EctoPrueba.Users.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias EctoPrueba.Blogs.Blog

  schema "users" do
    field :name, :string
    field :surname, :string
    field :complete_name, :string, virtual: true
    field :age, :integer
    field :active, :boolean
    field :username, :string

    # inserted_at, updated_at
    timestamps()

    # has_one
    # has_many
    # many_to_many
    # embeds_one
    # embeds_many
    has_many :blogs, Blog, on_delete: :delete_all
  end

  def complete_name(%__MODULE__{} = user) do
    "#{user.name} #{user.surname}"
  end

  def set_complete_name(%__MODULE__{} = user) do
    %{user | complete_name: complete_name(user)}
  end

  def new() do
    %__MODULE__{}
  end

  def create_changeset(attrs) when is_map(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:name, :surname, :age, :username])
    |> validate_required([:name, :surname, :age, :username])
    |> validate_length(:username, min: 4, max: 25)
    |> unique_constraint(:username)
    |> is_not_minor()
  end

  def update_status_changeset(%__MODULE__{} = user, attrs) when is_map(attrs) do
    user
    |> cast(attrs, [:active])
    |> validate_required([:active])
  end

  defp is_not_minor(%Ecto.Changeset{valid?: true} = changeset) do
    case get_change(changeset, :age) do
      age when is_integer(age) and age >= 18 ->
        changeset

      _ ->
        add_error(changeset, :age, "User is a minor")
    end
  end

  defp is_not_minor(invalid_changeset) do
    invalid_changeset
  end
end
