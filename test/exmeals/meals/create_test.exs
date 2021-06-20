defmodule Exmeals.Meals.CreateTest do
  use Exmeals.DataCase, async: true

  import Exmeals.Factory
  alias Exmeals.Meals.{Meal, Create}
  alias Exmeals.Error

  describe "call/1" do
    test "When all params are valid, returns the meal" do
      params = build(:meal_params)

      response = Create.call(params)

      assert {:ok,
              %Meal{
                id: _id,
                calorias: 600,
                data: ~N[2021-06-21 23:00:01],
                descricao: "Arroz com ovo"
              }} = response
    end

    test "When there are invalid params, returns an error" do
      params = build(:meal_params, %{"descricao" => "a", "calorias" => -10})

      response = Create.call(params)

      expected_response = %{
        calorias: ["must be greater than or equal to 0"],
        descricao: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
