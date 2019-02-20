defmodule Gumbo.Vehicle do
  use Gumbo.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields [:name, :model, :manufacturer, :vehicle_class]
  @optional_fields [
    :cost_in_credits,
    :length,
    :max_atmosphering_speed,
    :crew,
    :passengers,
    :cargo_capacity,
    :consumables
  ]

  schema "vehicles" do
    field(:name, :string)
    field(:model, :string)
    field(:manufacturer, :string)
    field(:cost_in_credits, :string)
    field(:length, :integer)
    field(:max_atmosphering_speed, :integer)
    field(:crew, :integer)
    field(:passengers, :integer)
    field(:cargo_capacity, :integer)
    field(:consumables, :string)
    field(:vehicle_class, :string)
    # belongs_to :pilots, Gumbo.Pilots, foreign_key: :pilots_id
    # belongs_to :films, Gumbo.Films, foreign_key: :films_id

    timestamps()
  end

  @spec changeset(t, Gumbo.params()) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = vehicles, params \\ %{}),
    do:
      vehicles
      |> cast(params, @optional_fields ++ @required_fields)
      |> validate_required(@required_fields)
end
