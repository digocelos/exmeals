defmodule Exmeals.Meals.DeleteTest do
  use Exmeals.DataCase, async: true

  import Exmeals.Factory

  alias Exmeals.Error
  alias Exmeals.Meals.{Create, Delete, Meal}

  describe "call/1" do
    setup do
      params = build(:meal_params)
      {:ok, %Meal{id: id}} = Create.call(params)
      {:ok, id: id}
    end

    test "When a valid id is given, returns the meal", %{id: id} do
      response = Delete.call(id)
      assert {:ok, %Meal{id: id, calorias: 600, descricao: "Arroz com ovo"}} = response
    end

    test "When there are invalid params, returns an error" do
      response = Delete.call("00000000-0000-0000-0000-000000000000")

      assert {:error, %Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
