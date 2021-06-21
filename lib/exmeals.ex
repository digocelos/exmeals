defmodule Exmeals do
  alias Exmeals.Meals.Create, as: MealCreate
  alias Exmeals.Meals.Delete, as: MealDelete
  alias Exmeals.Meals.Get, as: MealGet
  alias Exmeals.Meals.Update, as: MealUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate update_meal(params), to: MealUpdate, as: :call
  defdelegate delete(id), to: MealDelete, as: :call
end
