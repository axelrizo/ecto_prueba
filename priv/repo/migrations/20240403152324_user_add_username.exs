defmodule EctoPrueba.Repo.Migrations.UserAddUsername do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string, null: false, size: 25, default: "N/A"
    end
  end
end
