defmodule GumboWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.
  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common datastructures and query the data layer.
  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  import GumboWeb.TestHelpers, only: [user_params: 1]

  using do
    quote do
      use Phoenix.ConnTest
      import GumboWeb.{ConnCase, Router.Helpers, TestHelpers}

      @endpoint GumboWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Gumbo.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Gumbo.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  # @spec login_as(String.t()) :: GumboWeb.Admin.User.t()
  # def login_as(email) do
  #   params = user_params(email: email, permissions: [%{name: "USER_CREATE"}])
  #   {:ok, user} = GumboWeb.Accounts.register_user(params)
  #   user
  # end
end
