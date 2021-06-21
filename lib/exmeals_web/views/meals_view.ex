defmodule ExmealsWeb.MealsView do
  use ExmealsWeb, :view

  alias Exmeals.Meals.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meal: meal
    }
  end

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}

  def render("show.json", %{meal: %Meal{} = meal}), do: %{meal: meal}
end
