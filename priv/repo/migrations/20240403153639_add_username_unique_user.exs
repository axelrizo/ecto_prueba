defmodule EctoPrueba.Repo.Migrations.AddUsernameUniqueUser do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:username])
  end
end
