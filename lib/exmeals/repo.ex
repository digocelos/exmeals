defmodule Exmeals.Repo do
  use Ecto.Repo,
    otp_app: :exmeals,
    adapter: Ecto.Adapters.Postgres
end
