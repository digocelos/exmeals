defmodule Exmeals.Meals.MealTest do
  use Exmeals.DataCase, async: true

  import Exmeals.Factory

  alias Ecto.Changeset
  alias Exmeals.Meals.Meal

  describe "changeset/1" do
    test "When all params are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{changes: %{descricao: "Arroz com ovo"}, valid?: true} = response
    end

    test "When a params is invalid, returns an error" do
      params = build(:meal_params, %{"descricao" => "a", "calorias" => -10})

      response = Meal.changeset(params)

      expected_response = %{
        calorias: ["must be greater than or equal to 0"],
        descricao: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
