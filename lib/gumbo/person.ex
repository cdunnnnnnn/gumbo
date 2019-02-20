defmodule Gumbo.Person do
  use Gumbo.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields [:name]
  @optional_fields [:gender, :birth_year, :height, :mass, :hair_color, :skin_color, :eye_color]

  schema "people" do
    field(:name, :string)
    field(:gender, :string)
    field(:birth_year, :string)
    field(:height, :integer)
    field(:mass, :integer)
    field(:hair_color, :string)
    field(:skin_color, :string)
    field(:eye_color, :string)
    # belongs_to :homeworld, Gumbo.Homeworld, foreign_key: :homeworld_id
    # belongs_to :films, Gumbo.Films, foreign_key: :films_id
    # belongs_to :species, Gumbo.Species, foreign_key: :species_id
    # belongs_to :vehicles, Gumbo.Vehicles, foreign_key: :vehicles_id
    # belongs_to :starships, Gumbo.Starships, foreign_key: :starships_id

    timestamps()
  end

  @spec changeset(t, Gumbo.params()) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = people, params \\ %{}),
    do:
      people
      |> cast(params, @optional_fields ++ @required_fields)
      |> validate_required(@required_fields)
end
