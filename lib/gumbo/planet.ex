defmodule Gumbo.Planet do
  use Gumbo.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields [:name, :climate, :gravity, :terrain, :surface_water, :population]
  @optional_fields [:rotation_period, :orbital_period, :diameter]

  schema "planets" do
    field(:name, :string)
    field(:rotation_period, :integer)
    field(:orbital_period, :integer)
    field(:diameter, :integer)
    field(:climate, :string)
    field(:gravity, :string)
    field(:terrain, :string)
    field(:surface_water, :integer)
    field(:population, :integer)
    # belongs_to :residents, Gumbo.Residents, foreign_key: :residents_id
    # belongs_to :films, Gumbo.Films, foreign_key: :films_id

    timestamps()
  end

  @spec changeset(t, Gumbo.params()) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = planets, params \\ %{}),
    do:
      planets
      |> cast(params, @optional_fields ++ @required_fields)
      |> validate_required(@required_fields)
end
