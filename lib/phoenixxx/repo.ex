defmodule Phoenixxx.Repo do
  use Ecto.Repo,
    otp_app: :phoenixxx,
    adapter: Ecto.Adapters.Postgres
end
