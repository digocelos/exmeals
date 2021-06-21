defmodule Exmeals.Meals.UpdateTest do
  use Exmeals.DataCase, async: true

  import Exmeals.Factory

  alias Exmeals.Error
  alias Exmeals.Meals.{Create, Meal, Update}

  describe "call/1" do
    setup do
      params = build(:meal_params)
      {:ok, %Meal{id: id}} = Create.call(params)
      {:ok, id: id}
    end

    test "When a valid id is given, returns the meal", %{id: id} do
      params = string_params_for(:meal_update_params, %{"id" => id})

      response = Update.call(params)
      assert {:ok, %Meal{id: _id, descricao: "Arroz com bacalhau", calorias: 1300}} = response
    end

    test "When an invalid id is given, returns an error", %{id: id} do
      params = string_params_for(:meal_update_params, %{"id" => id, "calorias" => -10})
      response = Update.call(params)
      expected_response = %{calorias: ["must be greater than or equal to 0"]}

      assert {:error, %Error{status: _bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
