defmodule Gumbo.RecipeBook.Recipe do
  @moduledoc false

  use Gumbo.Schema

  import Ecto.Changeset

  alias __MODULE__, as: Recipe

  @derive {Poison.Encoder, except: [:__meta__, :inserted_at, :updated_at]}

  @categories [
    {0, :chicken},
    {1, :seafood}
  ]
  @required_params [
    :title,
    :body,
    :categories,
    :images,
    :published_at
  ]

  schema "recipes" do
    field(:title, :string)
    field(:body, :string)
    field(:categories, :string)
    field(:images, :string)
    field(:published_at, :naive_datetime)

    timestamps()
  end

  @doc false
  def changeset(%Recipe{} = recipes, params),
    do:
      recipes
      |> cast(params, @required_params)
      |> validate_required(@required_params)

  @doc """
  Returns categories options
  """
  def categories, do: @categories
end
