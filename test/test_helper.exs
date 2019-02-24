ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Gumbo.Repo, :manual)
Application.ensure_all_started(:bypass)
