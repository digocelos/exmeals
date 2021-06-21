defmodule ExmealsWeb.MealsViewTest do
  use ExmealsWeb.ConnCase, async: true

  import Phoenix.View
  import Exmeals.Factory

  alias ExmealsWeb.MealsView

  test "render create.json" do
    meal = build(:meal)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: meal,
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    meal = build(:meal)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: meal
           } = response
  end

  test "render show.json" do
    meal = build(:meal)

    response = render(MealsView, "show.json", meal: meal)

    assert %{
             meal: meal
           } = response
  end
end
