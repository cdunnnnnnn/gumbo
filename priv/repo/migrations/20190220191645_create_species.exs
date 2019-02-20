defmodule Gumbo.Repo.Migrations.CreateSpecies do
  use Ecto.Migration

  def change do
    create table(:species) do
      add(:name, :string)
      add(:classification, :string)
      add(:designation, :string)
      add(:average_height, :integer)
      add(:skin_color, :string)
      add(:hair_color, :string)
      add(:eye_colors, :string)
      add(:language, :string)

      timestamps()
    end
  end
end
