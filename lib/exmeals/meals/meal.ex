defmodule Exmeals.Meals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:descricao, :data, :calorias]

  @derive {Jason.Encoder, only: [:id, :descricao, :data, :calorias]}

  schema "meals" do
    field :descricao, :string
    field :data, :naive_datetime
    field :calorias, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast_meal(params)
  end

  def changeset(meal, params) do
    meal
    |> cast_meal(params)
  end

  defp cast_meal(meal, params) do
    meal
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:descricao, min: 6)
    |> validate_number(:calorias, greater_than_or_equal_to: 0)
  end
end
