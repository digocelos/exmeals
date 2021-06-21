defmodule Exmeals.Meals.Get do
  alias Exmeals.Meals.Meal
  alias Exmeals.{Error, Repo}

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found()}
      meal -> {:ok, meal}
    end
  end
end
