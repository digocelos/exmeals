defmodule ExmealsWeb.MealsView do
  use ExmealsWeb, :view

  alias Exmeals.Meals.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meal: meal
    }
  end
end
