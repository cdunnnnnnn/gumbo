defmodule Gumbo.SpeciesTest do
  use Gumbo.ModelCase

  alias Gumbo.Species

  @valid_attrs %{
    average_height: 42,
    classification: "some classification",
    designation: "some designation",
    eye_colors: "some eye_colors",
    hair_color: "some hair_color",
    language: "some language",
    name: "some name",
    skin_color: "some skin_color"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Species.changeset(%Species{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Species.changeset(%Species{}, @invalid_attrs)
    refute changeset.valid?
  end
end
