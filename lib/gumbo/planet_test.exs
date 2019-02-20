defmodule Gumbo.PlanetTest do
  use Gumbo.ModelCase

  alias Gumbo.Planet

  @valid_attrs %{
    climate: "some climate",
    diameter: 42,
    gravity: "some gravity",
    name: "some name",
    orbital_period: 42,
    population: 42,
    rotation_period: 42,
    surface_water: 42,
    terrain: "some terrain"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Planet.changeset(%Planet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Planet.changeset(%Planet{}, @invalid_attrs)
    refute changeset.valid?
  end
end
