defmodule EctoPrueba.Repo.Migrations.AddBlogTable do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string, null: false
      add :content, :text, null: false
      add :user_id, references(:users)
      timestamps()
    end
  end
end
