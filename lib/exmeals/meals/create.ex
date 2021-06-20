defmodule Exmeals.Meals.Create do
  alias Exmeals.{Repo, Error}
  alias Exmeals.Meals.Meal

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
