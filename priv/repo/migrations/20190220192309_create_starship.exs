defmodule Gumbo.Repo.Migrations.CreateStarship do
  use Ecto.Migration

  def change do
    create table(:starships) do
      add(:name, :string)
      add(:model, :string)
      add(:manufacturer, :string)
      add(:cost_in_credits, :integer)
      add(:max_atmosphering_speed, :integer)
      add(:crew, :integer)
      add(:passengers, :integer)
      add(:cargo_capacity, :integer)
      add(:consumables, :string)
      add(:hyperdrive_rating, :decimal)
      add(:mglt, :integer)
      add(:starship_class, :string)

      timestamps()
    end
  end
end
