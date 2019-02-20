defmodule Gumbo.Film do
  use Gumbo.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields [:title, :episode_id, :open_crawl, :director, :producer, :realease_date]
  # optional_fields []

  schema "films" do
    field(:title, :string)
    field(:episode_id, :integer)
    field(:open_crawl, :string)
    field(:director, :string)
    field(:producer, :string)
    field(:release_date, :date)
    # belongs_to :characters, Gumbo.Characters, foreign_key: :characters_id
    # belongs_to :planets, Gumbo.Planets, foreign_key: :planets_id
    # belongs_to :starships, Gumbo.Starships, foreign_key: :starships_id
    # belongs_to :vehicles, Gumbo.Vehicles, foreign_key: :vehicles_id
    # belongs_to :species, Gumbo.Species, foreign_key: :species_id

    timestamps()
  end

  @spec changeset(t, Gumbo.params()) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = films, params \\ %{}),
    do:
      films
      |> cast(params, @required_fields)
      |> validate_required(@required_fields)
end
