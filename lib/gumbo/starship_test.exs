defmodule Gumbo.StarshipTest do
  use Gumbo.ModelCase

  alias Gumbo.Starship

  @valid_attrs %{
    cargo_capacity: 42,
    consumables: "some consumables",
    cost_in_credits: 42,
    crew: 42,
    hyperdrive_rating: "120.5",
    manufacturer: "some manufacturer",
    max_atmosphering_speed: 42,
    mglt: 42,
    model: "some model",
    name: "some name",
    passengers: 42,
    starship_class: "some starship_class"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Starship.changeset(%Starship{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Starship.changeset(%Starship{}, @invalid_attrs)
    refute changeset.valid?
  end
end
