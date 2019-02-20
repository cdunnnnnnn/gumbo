defmodule Gumbo do
  @moduledoc """
  Documentation for Gumbo.
  """

  @type fields :: Keyword.t() | %{optional(atom) => term}
  @type id :: pos_integer
  @type params :: %{optional(atom) => term} | %{optional(String.t()) => term}
end
