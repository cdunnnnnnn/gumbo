defmodule Gumbo.Recipe do
  use Gumbo.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @required_fields [:title, :body, :published_at]
  @optional_fields [:categories, :images]

  schema "recipes" do
    field(:title, :string)
    field(:body, :string)
    field(:categories, :string)
    field(:images, :string)
    field(:published_at, :naive_datetime)

    timestamps()
  end

  @spec changeset(t, Gumbo.params()) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = recipes, params \\ %{}),
    do:
      recipes
      |> cast(params, @optional_fields ++ @required_fields)
      |> validate_required(@required_fields)
end
