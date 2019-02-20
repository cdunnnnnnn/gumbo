defmodule Gumbo.PersonTest do
  use Gumbo.ModelCase

  alias Gumbo.Person

  @valid_attrs %{
    birth_year: "some birth_year",
    eye_color: "some eye_color",
    gender: "some gender",
    hair_color: "some hair_color",
    height: 42,
    mass: 42,
    name: "some name",
    skin_color: "some skin_color"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Person.changeset(%Person{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Person.changeset(%Person{}, @invalid_attrs)
    refute changeset.valid?
  end
end
