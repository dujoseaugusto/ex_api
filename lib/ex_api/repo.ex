defmodule ExApi.Repo do
  use Ecto.Repo,
    otp_app: :ex_api,
    adapter: Ecto.Adapters.Postgres
end
