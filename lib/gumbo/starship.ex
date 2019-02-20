defmodule Gumbo.Starship do
  use Gumbo.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields [:name, :model, :manufacturer, :hyperdrive_rating, :starship_class]
  @optional_fields [
    :cost_in_credits,
    :max_atmosphering_speed,
    :crew,
    :passengers,
    :cargo_capacity,
    :consumables,
    :mglt
  ]

  schema "starships" do
    field(:name, :string)
    field(:model, :string)
    field(:manufacturer, :string)
    field(:cost_in_credits, :integer)
    field(:max_atmosphering_speed, :integer)
    field(:crew, :integer)
    field(:passengers, :integer)
    field(:cargo_capacity, :integer)
    field(:consumables, :string)
    field(:hyperdrive_rating, :decimal)
    field(:mglt, :integer)
    field(:starship_class, :string)
    # belongs_to :pilots, Gumbo.Pilots, foreign_key: :pilots_id
    # belongs_to :films, Gumbo.Films, foreign_key: :films_id

    timestamps()
  end

  @spec changeset(t, Gumbo.params()) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = starships, params \\ %{}),
    do:
      starships
      |> cast(params, @optional_fields ++ @required_fields)
      |> validate_required(@required_fields)
end
