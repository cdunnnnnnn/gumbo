defmodule Gumbo.Repo.Migrations.CreateFilm do
  use Ecto.Migration

  def change do
    create table(:films) do
      add(:title, :string)
      add(:episode_id, :integer)
      add(:open_crawl, :text)
      add(:director, :string)
      add(:producer, :string)
      add(:release_date, :date)

      timestamps()
    end
  end
end
