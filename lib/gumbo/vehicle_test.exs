defmodule Gumbo.VehicleTest do
  use Gumbo.ModelCase

  alias Gumbo.Vehicle

  @valid_attrs %{
    cargo_capacity: 42,
    consumables: "some consumables",
    cost_in_credits: "some cost_in_credits",
    crew: 42,
    length: 42,
    manufacturer: "some manufacturer",
    max_atmosphering_speed: 42,
    model: "some model",
    name: "some name",
    passengers: 42,
    vehicle_class: "some vehicle_class"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vehicle.changeset(%Vehicle{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vehicle.changeset(%Vehicle{}, @invalid_attrs)
    refute changeset.valid?
  end
end
