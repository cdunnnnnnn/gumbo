defmodule Gumbo.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add(:name, :string)
      add(:gender, :string)
      add(:birth_year, :string)
      add(:height, :integer)
      add(:mass, :integer)
      add(:hair_color, :string)
      add(:skin_color, :string)
      add(:eye_color, :string)

      timestamps()
    end
  end
end
