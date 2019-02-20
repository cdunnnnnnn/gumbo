defmodule Gumbo.Repo.Migrations.CreatePlanet do
  use Ecto.Migration

  def change do
    create table(:planets) do
      add(:name, :string)
      add(:rotation_period, :integer)
      add(:orbital_period, :integer)
      add(:diameter, :integer)
      add(:climate, :string)
      add(:gravity, :string)
      add(:terrain, :string)
      add(:surface_water, :integer)
      add(:population, :integer)

      timestamps()
    end
  end
end
