defmodule Gumbo.Repo.Migrations.AddRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add(:title, :string)
      add(:body, :text)
      add(:categories, :string)
      add(:images, :string)
      add(:published_at, :naive_datetime)

      timestamps()
    end

    create(unique_index(:recipes, [:title]))
  end
end
