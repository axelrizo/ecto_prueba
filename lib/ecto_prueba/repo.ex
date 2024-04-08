defmodule EctoPrueba.Repo do
  use Ecto.Repo,
    otp_app: :ecto_prueba,
    adapter: Ecto.Adapters.Postgres
end
