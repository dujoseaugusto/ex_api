defmodule ExApi.Repo.Migrations.CreateConversionTable do
  use Ecto.Migration

  def change do
    create table(:conversions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :origin_currency, :string
      add :target_currency, :string
      add :origin_value, :float
      add :conversion_rate, :float
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
