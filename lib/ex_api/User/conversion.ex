defmodule ExApi.User.Conversion do
  use Ecto.Schema
  import Ecto.Changeset

  alias ExApi.User

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "conversions" do
    field :name, :string
    field :origin_currency, :string
    field :target_currency, :string
    field :origin_value, :float
    field :conversion_rate, :float
    belongs_to(:user, User)
    timestamps()
  end

  @required [:name, :origin_currency, :target_currency, :origin_value, :conversion_rate, :user_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
    |> assoc_constraint(:user)
    |> validate_length(:origin_currency, max: 3)
    |> validate_length(:target_currency, max: 3)
  end

  #def update_changeset(conversion, params) do
 #   conversion
  #  |> cast(params, [:nickname])
  #  |> validate_required([:nickname])
 #   |> validate_length(:nickname, min: 2)
 # end
end
