defmodule Gumbo.Species do
  use Gumbo.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields [:name, :classification, :designation]
  @optional_fields [
    :name,
    :average_height,
    :skin_color,
    :hair_color,
    :eye_color,
    :language
  ]

  schema "species" do
    field(:name, :string)
    field(:classification, :string)
    field(:designation, :string)
    field(:average_height, :integer)
    field(:skin_color, :string)
    field(:hair_color, :string)
    field(:eye_colors, :string)
    field(:language, :string)
    # belongs_to :homeworld, Gumbo.Homeworld, foreign_key: :homeworld_id
    # belongs_to :people, Gumbo.People, foreign_key: :people_id
    # belongs_to :films, Gumbo.Films, foreign_key: :films_id

    timestamps()
  end

  @spec changeset(t, Gumbo.params()) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = species, params \\ %{}),
    do:
      species
      |> cast(params, @optional_fields ++ @required_fields)
      |> validate_required(@required_fields)
end
