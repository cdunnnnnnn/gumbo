defmodule Gumbo.Repo.Migrations.CreateVehicle do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add(:name, :string)
      add(:model, :string)
      add(:manufacturer, :string)
      add(:cost_in_credits, :string)
      add(:length, :integer)
      add(:max_atmosphering_speed, :integer)
      add(:crew, :integer)
      add(:passengers, :integer)
      add(:cargo_capacity, :integer)
      add(:consumables, :string)
      add(:vehicle_class, :string)

      timestamps()
    end
  end
end
