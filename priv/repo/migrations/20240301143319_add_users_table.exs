defmodule EctoPrueba.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :surname, :string, null: false
      add :age, :integer, null: false
      add :active, :boolean, default: false, null: false
      timestamps()
    end
  end
end
